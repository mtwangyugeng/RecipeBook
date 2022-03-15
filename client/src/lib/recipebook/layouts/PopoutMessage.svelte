<script>
    export let closeWindow;

    export let title;
</script>

<div class="container">
    <section>
        <div class="topbar">
            {title}
            <button class="closeWindow" on:click={closeWindow}>x</button>
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

    .topbar > .closeWindow {
        padding: 2px;
    }
</style>