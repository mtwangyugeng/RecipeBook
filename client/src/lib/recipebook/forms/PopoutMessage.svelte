<script>
    export let close;

    export let title;
</script>

<div class="container">
    <section>
        <div class="topbar">
            {title}
            <button class="close" on:click={close}>x</button>
        </div>
        <slot></slot>
    </section>
</div>


<style>
    .container {
        position: fixed;
        width: 100vw;
        height: 100vh;
        background-color: rgba(0,0,0, 0.7);
        left: 0;
        top: 0;

        display: flex;
        justify-content: center;
        align-items: center;
    }

    section {
        background-color: white;
        width: 400px;
    }

    .topbar {
        background-color: green;
        display: flex;
        justify-content: space-between;
    }

    .topbar > .close {
        padding: 2px;
    }
</style>