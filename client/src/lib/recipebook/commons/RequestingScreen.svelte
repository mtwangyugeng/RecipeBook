<script>
    export let message;
    $: requesting = message === "Requesting..."
</script>


{#if requesting}
    <div class="svg-container">
        <svg version="1.1" id="L2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
        viewBox="0 0 100 100" enable-background="new 0 0 100 100" xml:space="preserve">
            <circle fill="none" stroke="#fff" stroke-width="4" stroke-miterlimit="10" cx="50" cy="50" r="48"/>
            <line fill="none" stroke-linecap="round" stroke="#fff" stroke-width="4" stroke-miterlimit="10" x1="50" y1="50" x2="85" y2="50.5">
            <animateTransform 
                attributeName="transform" 
                dur="2s"
                type="rotate"
                from="0 50 50"
                to="360 50 50"
                repeatCount="indefinite" />
            </line>
            <line fill="none" stroke-linecap="round" stroke="#fff" stroke-width="4" stroke-miterlimit="10" x1="50" y1="50" x2="49.5" y2="74">
            <animateTransform 
                attributeName="transform" 
                dur="15s"
                type="rotate"
                from="0 50 50"
                to="360 50 50"
                repeatCount="indefinite" />
            </line>
        </svg>
    </div>
{/if}

<style>
    .svg-container {
        background-color: rgba(9, 36, 109, 0.452);
        position:absolute;
        height: 100%;
        top: 0;
        left: 0;

        display: flex;
        justify-content: center;
        align-items: center;
    }

    svg {
        height: 20%;
    }
</style>