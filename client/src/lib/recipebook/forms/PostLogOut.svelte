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
    
    <PopoutMessage close={close} title="Log Out">
        <section>
            {message}
            <div>
                <button class="yes" on:click={handleSubmit}>Yes</button>
                <button class="cancel" on:click={close}>Cancel</button>
            </div>
        </section>
    </PopoutMessage>
    
    <style>
        section {
            padding: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
            
        }

        div {
            margin-top: 20px;
        }
        button {
            width: 70px;
            height: 40px;
            margin: 0 10px 0 10px;
        }

        .yes {
            background-color: green;
        }
        .yes:hover {
            background-color: lightgreen;
        }

        .cancel {
            background-color: red;
        }
        .cancel:hover {
            background-color: pink;
        }
    </style>