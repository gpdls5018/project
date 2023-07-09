const videoChannel =document.querySelector('#video-channel');
const videoContainer =document.querySelector('#video-container');
const apikey ='AIzaSyARcLF9dtIkwTChKTcq6tVM0iMK1Gk5Fck';
const channellId = 'UCCGR6u27kI44_VWM1FJa7mw';

const channelEndpoint = `https://www.googleapis.com/youtube/v3/channels?key=${apikey}&id=${channellId}&part=snippet,contentDetails,statistics`;
//백틱으로 처리하며 가운데 '++'를 쓰는게 아닌 ${}를 쓴다
 console.log(videoChannel)
  console.log(videoContainer)
   console.log(apikey)
    console.log(channellId)
     console.log(channelEndpoint)
//언로드와 애러처리가능
fetch(channelEndpoint)
.then(res => res.json())
.then(data =>{ 
    console.log(data);
    showChannel(data);

    const playlistId = data.items[0].contentDetails.relatedPlaylists.uploads;
    requestPlaylist(playlistId);
});

function showChannel(data){
    const imageLink = data.items[0].snippet.thumbnails.medium.url;
    const title = data.items[0].snippet.title;
    const desc = data.items[0].snippet.description;
    const videos = data.items[0].statistics.videoCount;
    const subscri = data.items[0].statistics.subscriberCount;
    const views = data.items[0].statistics.viewCount;

    let output = `
    <div class="col-md-6 mb-4 text-center">
        <img class="img-fluid" src="img/htheal.jpg">
        <img class="img-fluid" src="${imageLink}" hidden> 
        <br>
        <a class="btn btn-danger btn-sm" href="https://youtube.com/@Kalo_Lee/${channellId}"
        target="_blank" hidden>약 정보 채널</a>
    </div>
    <div class="col-md-6 mb-4" >
        <ul class="list-group shadow-lg" style="border-radius: 20px;">
            <li class="list-group-item bg-danger text-white" hidden><strong>이름: ${title}</li>
            <li class="list-group-item " hidden>소개:<br/><br/>${desc}<br/><br/><br/><br/></li>
            <li class="list-group-item bg-danger text-white" ><strong>홍성민의 약학채널</li>
            <li class="list-group-item "style="font-size:20px;"><홍성민의 약학채널><br/><br/>
            어릴 때 부터 약학의 꿈을 가진 <br/>
            저는 많은 사람들에게 옳바른 약을 부자 가난한 사람 <br/>
            상관없이 처방 받으며 아픈사람이 없는<br/> 
            행복한 사회를 꿈꾸었습니다. <br/>
            <br/>
            <p style="font-wegiht:bold; color:blue;"> 늘 웃는 미소와 제 꿈을 위해 <br/>
            모두의 행복을 위해 더 노력하겠습니다.</p>
            </li>
        </ul>
    </div>
    `;
    videoChannel.innerHTML = output;
}


function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function requestPlaylist(playlistId) {
    const maxResults =6;
    const playlistURL = `https://www.googleapis.com/youtube/v3/playlistItems?key=${apikey}&playlistId=${playlistId}&part=snippet&maxResults=${maxResults}`;
    

    fetch(playlistURL)
    .then(res => res.json())
    .then(data => loadVideo(data));
}

function loadVideo(data){
    const playListItems =data.items;

    if(playListItems){
        let output= '';

        playListItems.map(item =>{
            const videoId = item.snippet.resourceId.videoId;

            output += `
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card card-body p-0" shadow embed-responsive embed-responsive-16by9">
                        <iframe  height="300px" src="https://www.youtube.com/embed/${videoId}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                    </div>
                </div>
            `;
        });

        videoContainer.innerHTML = output;
    } else{
        videoContainer.innerHTML ='비디오가 없어요!';
    }
}