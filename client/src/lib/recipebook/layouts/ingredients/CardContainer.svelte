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
        height: 120px;
        margin: 10px;
        border-radius: 10px;
        padding: 10px;
    }
</style>