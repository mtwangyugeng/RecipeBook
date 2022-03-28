<script>
    export let activated = false;
</script>


<div class={"active " + (activated && "activated")} on:click>
</div>


<style>
    .active {
        background-color: rgb(255, 255, 255);
        border: 1px solid #000;
        width: 20px;
        height: 20px;
        border-radius: 50%;
        position: absolute;
    }
    .activated {
        background-color: #000;
    }
</style>