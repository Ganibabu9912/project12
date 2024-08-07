<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Java Playlist by Telusko</title>
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
        <h1>Java Tutorials by Telusko</h1>
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
          name: "Java Introduction",
          src: "https://www.youtube.com/embed/bm0OyhwFDuY?si=kT9pQ97xWzdwqfSt",
          id: "vid_1"
       },
       {
    	   name: "Java Development Kit (JDK) Setup",
    	   src: "https://www.youtube.com/embed/WRISYpKhIrc?si=gzzI9IxQm5OLQfkX",
    	   id: "vid_2"
        },
        {
        	name: "First Code in Java",
            src: "https://www.youtube.com/embed/tSqNBjGacYk?si=ENbs2BJxditSFvO5",
            id: "vid_3"
        },
        {
            name: "How Java Works",
            src: "https://www.youtube.com/embed/NHrsLjhjmi4?si=AGADSWfwY2ROmbS7",
            id: "vid_4"
         },
         {
            name: "Variables in Java",
            src: "https://www.youtube.com/embed/9RCuKrze_-k?si=WEqk09muDwCvG5qB",
            id: "vid_5"
         },
         {
            name: "Data types in Java",
            src: "https://www.youtube.com/embed/Le25I331_yU?si=BUqXjI3ttYepv-sk",
            id: "vid_6"
         },
         {
            name: "Literal in Java",
            src: "https://www.youtube.com/embed/iZXLCM5bzRI?si=bZlp5x3ZV8QeoLtY",
            id: "vid_7"
         },
         {
            name: "Type Conversion in Java",
            src: "https://www.youtube.com/embed/CPk8pffKV64?si=FyCyTOeQjUSSs-mv",
            id: "vid_8"
         },
         {
            name: "Arithmetic Operators in Java",
            src: "https://www.youtube.com/embed/flWjzwzgybI?si=X7kN2hPZqSyZKLxu",
            id: "vid_9"
         },
         {
            name: "Relational Operators in Java",
            src: "https://www.youtube.com/embed/TEJpeRI_NEo?si=kpgB9wbJfruBvyrK",
            id: "vid_10"
         },
         {
            name: "Logical Operators in Java",
            src: "https://www.youtube.com/embed/hLimYJZQ2kc?si=3hLYcWNEuYaw_rtV",
            id: "vid_11"
         },
         {
            name: "If else in Java",
            src: "https://www.youtube.com/embed/74Q7POjS7mQ?si=trQXHJ377EY6kRkG",
            id: "vid_12"
         },
           {
            name: "If Else If in Java",
            src: "https://www.youtube.com/embed/Tn6BNLD0PmU?si=90XxZNTHmNNUBTe3",
            id: "vid_13"
         },
         {
            name: "Ternary Operator in Java",
            src: "https://www.youtube.com/embed/kBdZBbWZ2a4?si=UdVA7kTSG-WiJacJ",
            id: "vid_14"
         },
         {
            name: "Switch Statement in Java",
            src: "https://www.youtube.com/embed/IrQKDdptiw8?si=fpepdKC__viez3dD",
            id: "vid_15"
         }
       

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
