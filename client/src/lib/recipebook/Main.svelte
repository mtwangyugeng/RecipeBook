<script>
import Content from "./Content.svelte";
import SideBar from "./SideBar.svelte";
    let currentRecipe = null
    const setCurrentRecipeId = (neo) =>{
        return () => {currentRecipeId = neo}
    }
    let currentRecipeId = null;
</script>

<section>
    <SideBar setCurrentRecipeId={setCurrentRecipeId}/>
    <Content currentRecipeId={currentRecipeId}/>
</section>

<style>
    section {
        display: flex;
        background-color: blue;
        height: 100%;
    }
</style>