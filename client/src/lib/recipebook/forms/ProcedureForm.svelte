<form>
    <label for="content">Recipe name:
        <input type="text" id="content" name="content" placeholder="Enter content">
    </label>
    <input type="submit" value="Submit">
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