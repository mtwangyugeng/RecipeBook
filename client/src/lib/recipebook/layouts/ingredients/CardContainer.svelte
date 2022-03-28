<section>
    <slot />
</section>


<style>
    section {
        display: flex;
        flex-wrap: wrap;
        max-width: 700px;
        position: relative;
    }

    section :global(.card) {
        width: 200px;
        height: 260px;
        margin: 10px;
        border-radius: 10px;
    }
</style>