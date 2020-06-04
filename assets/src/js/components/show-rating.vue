<template>
    <div v-if="rating" class="sfStarsWrapper">
        <div :class="star1"></div>
        <div :class="star2"></div>
        <div :class="star3"></div>
        <div :class="star4"></div>
        <div :class="star5"></div>
    </div>
</template>
<script>
    export default {
        name: "showRating",
        props: [
            'rating',
            'ratingWatch',
            'star1',
            'star2',
            'star3',
            'star4',
            'star5',
        ],
        watch: {
            ratingWatch: function (value) {
                if (!value) {
                    return;
                }

                var rating = this.$root.getRating(value);

                for (var i = 1; i <= 5; i++) {
                    if (i <= rating) {
                        this['star' + i] = 'star on';
                    }
                    else {
                        this['star' + i] = 'star';
                    }
                }
            }
        },
        mounted: function () {
            this.ratingWatch = this.rating;
        }
    };
</script>
