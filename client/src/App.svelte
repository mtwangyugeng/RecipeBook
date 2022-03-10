<script>
  import RecipeBook from "./lib/recipebook/Main.svelte";
</script>

<main>
  <RecipeBook />
</main>

<style>
:global(*) {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}
:root {
  scroll-behavior: smooth;
}

:global(button), :global(input[type="submit"]), :global(input[type="reset"]) {
	background: none;
	color: inherit;
	border: none;
	padding: 0;
	font: inherit;
	cursor: pointer;
	outline: inherit;
}
</style>