<script>
    import PopoutMessage from "./PopoutMessage.svelte";
    export let close;
    
    import {postSignin} from '../stores/User'

    let message = "Please enter a username and password";

    const handleSubmit = async () => {
        message = "requesting..."
        const status = await postSignin({"email":email, "password":password})
        if(status == 202) {
            close();
        }
    }
    
    

    let email = "";
    let password = "";
    
    const inputEmail = (e) => {email = e.target.value}
    const inputPassword = (e) => {password = e.target.value}
    
    let show_password = false
    $: passwordType = show_password ? 'text' : 'password'
    
    </script>
    
    <PopoutMessage close={close} title="Sign In">
        {message}
        <form on:submit|preventDefault={handleSubmit}>
            <label for="email">Email:</label> <br>
            <input type="email" value={email} on:input={inputEmail} id="email" name="email" placeholder="Enter email" required>
        
            <label for="password">Password:</label> <br>
            <input type={passwordType} value={password} on:input={inputPassword} id="password" name="password" placeholder="Enter password" required>
            
            <label>
                <input type=checkbox bind:checked={show_password}>
                Show Password
            </label>
        
            <input type="submit" value="Sign In">
        </form>    
    </PopoutMessage>
    
    <style>
        form {
            width: 400px;
    
            display: flex;
            flex-direction: column;
            padding: 20px;
        }
    
        form > input[type="submit"] {
            background-color: yellow;
            padding: 10px;
        }
        form > input[type="submit"]:hover {
            background-color: rgb(255, 145, 0);
        }
    
    
        label {
            user-select: none;
            cursor: pointer;
        }
    </style>