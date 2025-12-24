<script lang="ts">
	import HomeIcon from './../../components/icons/homeIcon.svelte';
	import Card from '../../components/card.svelte';
	import PlusIcon from '../../components/icons/plusIcon.svelte';

	let vms: any[] = [];
</script>

<main>
	{#if vms.length === 0}
		<p class="mt-8 text-center text-gray-200">
			No virtual machines yet, create one to get started.
		</p>
	{:else}
		<div class="container mx-auto flex flex-wrap justify-center gap-2 px-8 py-4">
			{#each vms as vm}
				<Card image={vm.image} alt={vm.alt} title={vm.title} paragraph={vm.paragraph} />
			{/each}
		</div>
	{/if}
	<div class="dock">
		<button>
			<PlusIcon />
			<span class="dock-label">Add</span>
		</button>
	</div>
</main>
