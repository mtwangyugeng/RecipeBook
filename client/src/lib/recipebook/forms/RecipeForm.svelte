<form>
    <label for="recipe_name">Recipe name:
        <input type="text" id="recipe_name" name="recipe_name" placeholder="Enter recipe name">
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