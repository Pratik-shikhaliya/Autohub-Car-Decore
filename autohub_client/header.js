let a = document.getElementById('link1');
let b = document.getElementById('link2');
let c = document.getElementById('link3');
let d = document.getElementById('link4');
let e = document.getElementById('link5');


function link1(){
    a.classList.toggle('active');
    b.classList.remove('active');
    c.classList.remove('active');
    d.classList.remove('active');
    e.classList.remove('active');
};
function link2(){
    a.classList.remove('active');
    b.classList.toggle('active');
    c.classList.remove('active');
    d.classList.remove('active');
    e.classList.remove('active');
};
function link3(){
    a.classList.remove('active');
    b.classList.remove('active');
    c.classList.toggle('active');
    d.classList.remove('active');
    e.classList.remove('active');
};
function link4(){
    a.classList.remove('active');
    b.classList.remove('active');
    c.classList.remove('active');
    d.classList.toggle('active');
    e.classList.remove('active');
};
function link5(){
    a.classList.remove('active');
    b.classList.remove('active');
    c.classList.remove('active');
    d.classList.remove('active');
    e.classList.toggle('active');
};