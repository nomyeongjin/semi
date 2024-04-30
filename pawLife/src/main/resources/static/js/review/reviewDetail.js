// const updateBtn = document.querySelector(".update-btn")

// updateBtn.addEventListener("click",()=>{
//     location.href="reviewUpdate"
// })


/* 댓글 목록 조회 */
const selectCommentList = () => {

    // console.log(reviewNo);

    fetch("/comment?reviewNo=" + reviewNo)
    .then(resp => resp.json())
    .then(commentList => {

        console.log(commentList);

        const ul = document.querySelector("#commentList");
        ul.innerHTML = "";

        for(let comment of commentList) {

            const li = document.createElement("li");
            li.classList.add("comment-row");

            // 작성자 (p태그)
            const commentWriter = document.createElement("p");
            commentWriter.classList.add("comment-writer");

            // p태그 하위 요소
            const profileImg = document.createElement("img");
            // 이미지 추가할것
            // if(comment.profileImg == null)  profileImg.src = userDefaultImage;
            // else    profileImg.src = comment.profileImg;

            const nickname = document.createElement("span");
            nickname.innerText = comment.memberNickname;

            const commentDate = document.createElement("span");
            commentDate.classList.add("comment-date");
            commentDate.innerText = comment.commentWriteDate;

            commentWriter.append(profileImg, nickname, commentDate);
            //li.append(commentWriter);

            // 덧글 내용
            const content = document.createElement("p");
            content.classList.add("comment-content");
            content.innerText = comment.commentContent;
            li.append(commentWriter, content);

            // 버튼
            const commentBtnArea = document.createElement("div");
            commentBtnArea.classList.add("comment-btn-area");

            if(loginMemberNo != null && loginMemberNo == comment.memberNo){

                const updateBtn = document.createElement("button");
                updateBtn.innerText = "수정";
                updateBtn.setAttribute("onclick", `showUpdateComment(${comment.commentNo}, this)`);

                const deleteBtn = document.createElement("button");
                deleteBtn.innerText = "삭제";
                deleteBtn.setAttribute("onclick", `deleteComment(${comment.commentNo})`);

                // 버튼 영역에 수정/삭제 버튼 추가
                commentBtnArea.append(updateBtn, deleteBtn);
                li.append(commentBtnArea);
            }
            ul.append(li);
        }
    })
}

selectCommentList();