<script lang="ts">
	import { goto } from '$app/navigation';
	import ArrowIcon from './icons/arrowIcon.svelte';

	export let image;
	export let alt;
	export let title;
	export let paragraph;
</script>

<div class="card w-96 border border-base-300 bg-base-100 shadow-sm">
	<figure>
		<img src={image} {alt} class="primary mx-auto h-auto w-48" />
	</figure>
	<div class="card-body">
		<h2 class="card-title">{title}</h2>
		<p>{paragraph}</p>
		<div class="card-actions justify-end">
			<button class="btn" on:click={() => goto('/vm')}><ArrowIcon /></button>
		</div>
	</div>
</div>
