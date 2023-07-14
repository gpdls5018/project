package com.kosmo.springapp.service;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.KeyPair;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.nio.client.CloseableHttpAsyncClient;
import org.apache.http.impl.nio.client.HttpAsyncClients;
import org.jose4j.lang.JoseException;

import nl.martijndwars.webpush.AbstractPushService;
import nl.martijndwars.webpush.ClosableCallback;
import nl.martijndwars.webpush.Encoding;
import nl.martijndwars.webpush.HttpRequest;
import nl.martijndwars.webpush.Notification;

public class PushService extends AbstractPushService<PushService>{
	 public PushService() {
	    }

	    public PushService(String gcmApiKey) {
	        super(gcmApiKey);
	    }

	    public PushService(KeyPair keyPair) {
	        super(keyPair);
	    }

	    public PushService(KeyPair keyPair, String subject) {
	        super(keyPair, subject);
	    }

	    public PushService(String publicKey, String privateKey) throws GeneralSecurityException {
	        super(publicKey, privateKey);
	    }

	    public PushService(String publicKey, String privateKey, String subject) throws GeneralSecurityException {
	        super(publicKey, privateKey, subject);
	    }

	    /**
	     * Send a notification and wait for the response.
	     *
	     * @param notification
	     * @param encoding
	     * @return
	     * @throws GeneralSecurityException
	     * @throws IOException
	     * @throws JoseException
	     * @throws ExecutionException
	     * @throws InterruptedException
	     */
	    public HttpResponse send(Notification notification, Encoding encoding) throws GeneralSecurityException, IOException, JoseException, ExecutionException, InterruptedException {
	        return sendAsync(notification, encoding).get();
	    }

	    public HttpResponse send(Notification notification) throws GeneralSecurityException, IOException, JoseException, ExecutionException, InterruptedException {
	        return send(notification, Encoding.AESGCM);
	    }

	    /**
	     * Send a notification, but don't wait for the response.
	     *
	     * @param notification
	     * @param encoding
	     * @return
	     * @throws GeneralSecurityException
	     * @throws IOException
	     * @throws JoseException
	     *
	     * @deprecated Use {@link PushAsyncService#send(Notification, Encoding)} instead.
	     */
	    @Deprecated
	    public Future<HttpResponse> sendAsync(Notification notification, Encoding encoding) throws GeneralSecurityException, IOException, JoseException {
	        HttpPost httpPost = preparePost(notification, encoding);

	        final CloseableHttpAsyncClient closeableHttpAsyncClient = HttpAsyncClients.createSystem();
	        closeableHttpAsyncClient.start();

	        return closeableHttpAsyncClient.execute(httpPost, new ClosableCallback(closeableHttpAsyncClient));
	    }

	    /**
	     * @deprecated Use {@link PushAsyncService#send(Notification)} instead.
	     */
	    @Deprecated
	    public Future<HttpResponse> sendAsync(Notification notification) throws GeneralSecurityException, IOException, JoseException {
	        return sendAsync(notification, Encoding.AES128GCM);
	    }

	    /**
	     * Prepare a HttpPost for Apache async http client
	     *
	     * @param notification
	     * @param encoding
	     * @return
	     * @throws GeneralSecurityException
	     * @throws IOException
	     * @throws JoseException
	     */
	    public HttpPost preparePost(Notification notification, Encoding encoding) throws GeneralSecurityException, IOException, JoseException {
	        HttpRequest request = prepareRequest(notification, encoding);
	        HttpPost httpPost = new HttpPost(request.getUrl());
	        request.getHeaders().forEach(httpPost::addHeader);
	        if (request.getBody() != null) {
	            httpPost.setEntity(new ByteArrayEntity(request.getBody()));
	        }
	        return httpPost;
	    }
}