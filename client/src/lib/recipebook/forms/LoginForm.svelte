<form>
    <label for="amount">email:
        <input type="text" id="email" name="email" placeholder="Enter email">
    </label>

    <label for="password">password:
        <input type="text" id="password" name="password" placeholder="Enter password">
    </label>

    <input type="submit" value="Login">
</form>


<style>
    form {
        display: flex;
        justify-content: space-around;
        padding: 20px;
    }

    form > input[type="submit"] {
        background-color: yellow;
    }
</style>