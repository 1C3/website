window.addEventListener("scroll", () => {
    document.documentElement.style.setProperty(
        "--scroll",
        (window.scrollY / window.innerHeight) * 100,
    );
});

document.querySelectorAll(".track-pointer").forEach((element) => {
    element.addEventListener("mousemove", (event) => {
        boundingRect = element.getBoundingClientRect();
        element.style.setProperty(
            "--mouse-x",
            (event.offsetX / boundingRect.width) * 100 - 50,
        );
        element.style.setProperty(
            "--mouse-y",
            (event.offsetY / boundingRect.height) * 100 - 50,
        );
    });
});
