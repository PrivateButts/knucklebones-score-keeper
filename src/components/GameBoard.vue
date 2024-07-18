<template>
  <div
    class="row"
    :class="{ 'items-end': props.flip, 'items-start': !props.flip }"
  >
    <div v-for="(row, x) in board" :key="x" class="column col">
      <p v-if="!props.flip" class="col col-shrink text-center q-my-sm">
        {{ score(row) }}
      </p>
      <div class="col column" v-if="props.flip">
        <q-input
          v-for="(cell, y) in row"
          outlined
          :item-aligned="true"
          min="0"
          max="6"
          :key="y"
          v-model="board[x][y]"
          type="number"
          class="col fit text-center"
        />
      </div>
      <div class="col column" v-if="!props.flip">
        <q-input
          v-for="(cell, y) in row.reverse()"
          outlined
          :item-aligned="true"
          min="0"
          :key="y"
          v-model="board[x][y]"
          type="number"
          class="col fit text-center"
        />
      </div>
      <p v-if="props.flip" class="col col-shrink text-center q-my-sm">
        {{ score(row) }}
      </p>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';

interface Props {
  flip: boolean;
}

const props = withDefaults(defineProps<Props>(), {
  flip: false,
});

const board = ref<Array<Array<number>>>([
  [0, 0, 0],
  [0, 0, 0],
  [0, 0, 0],
]);

const score = (row: number[]) => {
  const counts: Record<number, number> = {};
  row.forEach((cell) => {
    if (counts[cell]) {
      counts[cell] += 1;
    } else {
      counts[cell] = 1;
    }
  });

  let s = 0;
  row.forEach((cell) => {
    s += cell * counts[cell];
  });

  return s;
};
</script>

<style>
.text-center input {
  text-align: center;
}
</style>
