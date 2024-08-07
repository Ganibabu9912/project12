<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>html Playlist by freecode camp</title>
    <style>
        .section .h1 {
	text-align: center;
	margin-top: 5rem;
	font-size: 1.125rem;
	line-height: 1.5;
	transition: all 725ms ease-in-out;
	font-size: 2rem;
	font-weight: bolder;
	margin-bottom: 3rem;
	color: white;
}
*
{
    padding: 0;
    box-sizing: border-box;
}
body::-webkit-scrollbar
{
   width: 10px;
}
body::-webkit-scrollbar-thumb
{
   height: 80px;
   background: #78ebfc 100%;
   border: 8px solid transparent;
   border-radius: 12px;
}
body::-webkit-scrollbar-thumb:active
{
    background: #8b5aed 0%;
}
body
{
    font-family: sans-serif;
    background: linear-gradient(45deg, #8b5aed 0%, #78ebfc 100%);
}
li
{
    list-style: none;
}
section
{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    padding: 2.5%;
    min-height: 100vh;
}
.title
{
    font-size: 20px;
    font-weight: 600;
    color: #dcdee1;
    text-align: left;
    width: 100%;
    margin-bottom: 10px;
}
.container
{
    position: relative;
    width: 100%;
    height: 100%;
    display: grid;
    grid-template-columns: 2fr 1fr;
    overflow: hidden;
    /* border: 2px solid red; */
}
.container #main-Video
{
    position: relative;
    width: 100%;
    height: 470px;
    overflow: hidden;
    outline: none;
}

.playlistBx
{
    position: relative;
    height: 100%;
    margin: 0 10px 0 10px;
    /* border: 2px solid green; */
}
.playlist
{
    position: absolute;
    width: 100%;
    height: calc(100% - 40px);
    overflow-y: scroll;
    border-top: 1px solid #dcdee1;
}
.playlist::-webkit-scrollbar
{
   width: 0px;
}
.playlistBx .row .AllLessons
{
   display: block;
   text-align: left;
   color: #dcdee1;
   font-size: 15px;
   font-weight: 700;
   margin-left: 40px;
   line-height: 40px;
}
.playlist li
{
   display: flex;
   justify-content: space-between;
   align-items: center;
   list-style: none;
   color: #dcdee1;
   cursor: pointer;
   border: 1px solid transparent;
   padding: 15px 20px;
   border-radius: 5px;
}
.playlist li:hover
{
    border: 0.5px solid #dcdee1;
}
.playlist li .row span
{
    font-size: 15px;
    font-weight: 400;
    color: #dcdee1;
    text-decoration: none;
    display: inline-block;
    text-align: left;
}
.playlist li .row span::before
{
    content: '\f01d';
    font-family: FontAwesome;
    color: #dcdee1;
    margin-right: 15px;
    font-size: 20px;
}
ul li.playing .row span::before
{
    content: '\f28c';
    font-family: FontAwesome;
    color: #fff;
    margin-right: 15px;
    font-size: 20px;
}
.playlist li.playing .row span
{
   color: #fff;
}
.playlist li span.duration
{
    font-size: 15px;
    font-weight: 400;
    display: inline-block;
    color: #dcdee1;
    text-align: right;
}
.playlist li.playing
{
   pointer-events: none;
   background: #8b5aed 0%;
   border: 0.5px solid #78ebfc 100%;
}

@media(max-width: 1092px){
    section
    {
        padding: 30px 10px;
    }
    .container
    {
        width: 100%;
        display: grid;
        grid-template-columns: repeat(1,1fr);
        overflow: hidden;
    }
    .container #main-Video
    {
        height: 400px;
    }
    .playlistBx
    {
        height: 380px;
        margin-top: 10px;
    }
    .playlist
    {
        position: absolute;
        width: 100%;
        height: calc(100% - 40px);
        overflow-y: scroll;
    }
}
@media(max-width: 650px){
    #main-Video
    {
        height: 300px !important;
    }
}
@media(max-width: 500px){
    #main-Video
    {
        height: 280px !important;
    }
}
@media(max-width: 400px){
    #main-Video
    {
        height: 250px !important;
    }
}    </style>
</head>
<body>
    <section>
        <h1>html tutorial by freecode camp</h1>
        <h2 class="title"></h2>
        <div class="container">
            <div id="video_player">
                <iframe controls id="main-Video" src="" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
            <div class="playlistBx">
                <div class="header">
                    <div class="row">
                        <span class="AllLessons"></span>
                    </div>
                </div>
                <ul class="playlist" id="playlist"></ul>
            </div>
        </div>
    </section>
    <script>
 // Ensure allVideos is defined and not empty
    let allVideos = [
       {
          name: "html Introduction",
          src: "https://www.youtube.com/embed/kUMe1FH4CHE?si=nKviGZXCysU0zC7i",
            id: "vid_3"
        },
        {
            name: "Getting started with html",
            src:"https://www.youtube.com/embed/kUMe1FH4CHE?si=FUl3l0Wm-Fkbkc1W&amp;start=60",
            id: "vid_4"
         },
       
         {
            name: "Text basics",
            src: "https://www.youtube.com/embed/kUMe1FH4CHE?si=o4Qb1PHXcEdAquNV&amp;start=1742" ,
            id: "vid_6"
         },
         {
            name: "List types",
            src:"https://www.youtube.com/embed/kUMe1FH4CHE?si=JX2nuxX4B_t3LDex&amp;start=2989" ,
            id: "vid_7"
         },
         {
            name: "Add Links",
            src:"https://www.youtube.com/embed/kUMe1FH4CHE?si=JX2nuxX4B_t3LDex&amp;start=3600" ,
            id: "vid_8"
         },
         {
            name: "Add images",
            src: "https://www.youtube.com/embed/kUMe1FH4CHE?si=JX2nuxX4B_t3LDex&amp;start=5446",
            id: "vid_9"
         },
         {
            name: "Semantic tags",
            src: "https://www.youtube.com/embed/kUMe1FH4CHE?si=JX2nuxX4B_t3LDex&amp;start=7262",
            id: "vid_10"
         },
         {
            name: "forms and inputs",
            src: "https://www.youtube.com/embed/kUMe1FH4CHE?si=JX2nuxX4B_t3LDex&amp;start=9646" ,
            id: "vid_11"
         },
         {
            name: "HTML project",
            src: "https://www.youtube.com/embed/kUMe1FH4CHE?si=JX2nuxX4B_t3LDex&amp;start=12318",
            id: "vid_12"
         },
           {
            name: "Html create table",
            src:"https://www.youtube.com/embed/kUMe1FH4CHE?si=JX2nuxX4B_t3LDex&amp;start=8697",
            id:"vid_13"
         },
        
       

    ];

    // Ensure document content is fully loaded before executing script
    document.addEventListener('DOMContentLoaded', function() {
        const mainVideo = document.getElementById('main-Video');
        const videoTitle = document.querySelector('.title');
        const AllLessons = document.querySelector('.AllLessons');
        const playlist = document.getElementById('playlist');

        // Check if elements exist and handle them accordingly
        if (mainVideo && videoTitle && AllLessons && playlist) {
            AllLessons.textContent = `${allVideos.length} Lessons`;

            // Function to load a video based on index
            function loadVideo(index) {
                mainVideo.src = allVideos[index].src;
                videoTitle.textContent = `${index + 1}. ${allVideos[index].name}`;
            }

            // Populate playlist dynamically
            allVideos.forEach((video, index) => {
                const li = document.createElement('li');
                li.textContent = video.name;
                li.addEventListener('click', () => loadVideo(index));
                playlist.appendChild(li);
            });

            // Load initial video (optional)
            loadVideo(0);
        } else {
            console.error("One or more required elements are missing.");
        }
    });
    </script>
    </body>
</html>
