<script>
    import Content from "./Content.svelte";
    import SideBar from "./SideBar.svelte";

    let currentRecipeId = null;
    let currentTitle = "";

    const setCurrentRecipeId = (neo, title="") =>{
        currentRecipeId = neo;
        currentTitle = title;
    }
    
</script>

<section>
    <SideBar setCurrentRecipeId={setCurrentRecipeId}/>
    <Content currentRecipeId={currentRecipeId} currentTitle={currentTitle}/>
</section>

<style>
    section {
        display: flex;
        background-color: blue;
        height: 100%;
    }
</style>