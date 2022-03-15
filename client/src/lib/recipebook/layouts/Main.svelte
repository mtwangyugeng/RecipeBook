<script>
import TopBar from './TopBar.svelte'
import BottomContainer from './BottomContainer.svelte' 
import Ingredients from './ingredients/Ingredients.svelte';
import Recipes from './recipes/Recipes.svelte';

const tabs = ['Ingredients', 'Recipes']
let currentTab = 'Ingredients';
const switchTab = (imp) => {
    currentTab = imp
    console.log(currentTab)
}
</script>


<section>
    <TopBar tabs={tabs} switchTab={switchTab} />
    <BottomContainer>
        {currentTab}
        {#if currentTab === "Ingredients"}
            <Ingredients />
        {:else if currentTab === "Recipes"}
            <Recipes />
        {/if}
    </BottomContainer>
</section>


<style>
    section {
        height:100%
    }
</style>