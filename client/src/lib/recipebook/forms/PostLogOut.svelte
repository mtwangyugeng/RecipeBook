<script>
    import PopoutMessage from "./PopoutMessage.svelte";
    export let close;
    
    import {logout} from '../stores/User'

    let message = "Log out?";

    const handleSubmit = async () => {
        message = "requesting...";
        logout();
        close();
    }
    
    </script>
    
    <PopoutMessage close={close} title="Sign In">
        {message}
        <button on:click={handleSubmit}>Yes</button>
        <button on:click={close}>Cancel</button>
    </PopoutMessage>
    
    <style>
    </style>