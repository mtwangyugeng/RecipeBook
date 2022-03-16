<script>
import PopoutMessage from "../PopoutMessage.svelte";
export let close;

import {postSignup} from '../../stores/User'
const handleSubmit = async () => {
    if (password === confirm_password){
        const status = await postSignup({"email":email, "password":password})
        if(status == 201) {
            close();
        }
    } else {
        // TODO: unequal passwords message
    }
}

let email = "";
let password = "";
let confirm_password = "";

const inputEmail = (e) => {email = e.target.value}
const inputPassword = (e) => {password = e.target.value}
const inputConfirmPassword = (e) => {confirm_password = e.target.value}

let show_password = false
$: passwordType = show_password ? 'text' : 'password'

</script>

<PopoutMessage closeWindow={close} title="Sign Up">
    <form on:submit|preventDefault={handleSubmit}>
        <label for="email">Email:</label> <br>
        <input type="email" value={email} on:input={inputEmail} id="email" name="email" placeholder="Enter email" required>
    
        <label for="password">Password:</label> <br>
        <input type={passwordType} value={password} on:input={inputPassword} id="password" name="password" placeholder="Enter password" required>
        
        <label for="confirm_password">Confirm Password:</label> <br>
        <input type={passwordType} value={confirm_password} on:input={inputConfirmPassword} id="confirm_password" name="confirm_password" placeholder="Confirm password" required>
        
        <label>
            <input type=checkbox bind:checked={show_password}>
            Show Password
        </label>
    
        <input type="submit" value="Sign Up">
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