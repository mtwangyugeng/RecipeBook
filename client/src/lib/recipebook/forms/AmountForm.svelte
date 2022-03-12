<form>
    <label for="amount">Ingredient Amount:
        <input type="text" id="amount" name="amount" placeholder="Enter amount">
    </label>
    <select name="unit" id="unit">
        <optgroup label="Ingredients">
            <option value="change me">change me</option>
        </optgroup>
    </select>
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