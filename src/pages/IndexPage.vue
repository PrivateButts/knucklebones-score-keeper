<template>
  <q-page class="column">
    <GameBoard class="col" :flip="true"></GameBoard>
    <hr class="fit" />
    <GameBoard class="col" :flip="false"></GameBoard>
  </q-page>
</template>

<script setup lang="ts">
import GameBoard from 'components/GameBoard.vue';

defineOptions({
  name: 'IndexPage',
});
</script>
