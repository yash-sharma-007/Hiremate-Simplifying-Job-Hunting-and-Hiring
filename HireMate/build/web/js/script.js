let listofskills=[]
function ADD(){
    window.event.preventDefault();
    let skl=document.getElementById('skill').value;
    listofskills.push(skl);
    console.log(skl);
    document.getElementById('skill-list').innerText=listofskills;
}