import { initializeComponent } from "../functions/init";
import showRating from "../components/show-rating";
import store from '../store';

import { mapState } from 'vuex';

initializeComponent("review-list", initReviewList);

function initReviewList(rootElement) {
    new Vue({
        el: '#' + rootElement.id,
        store,
        props: ['purl', 'pid'],
        data: {
            Reviews: null
        },
        computed: {
            count: function () {
                return this.Reviews.length;
            },
            displayRating: function () {
                var reviewSum = 0;
                var count = 0;

                if (!this.Reviews.length) {
                    return;
                }

                for (var review of this.Reviews) {
                    if (this.getRating(review.Rating)) {
                        reviewSum += this.getRating(review.Rating);
                        count++;
                    }
                }

                return (reviewSum / count).toFixed(2);
            },
            averageRating: function () {
                var reviewSum = 0;
                var count = 0;

                if (!this.Reviews.length) {
                    return;
                }

                for (var review of this.Reviews) {
                    if (this.getRating(review.Rating)) {
                        reviewSum += this.getRating(review.Rating);
                        count++;
                    }
                }

                return ((reviewSum / count) * 20);
            },
            ...mapState([
                'updateIteration'
            ])
        },
        components: {
            showRating
        },
        methods: {
            hasValue: function (x) {
                if (typeof (x) !== 'undefined' && x !== null) {
                    return true;
                }
                else {
                    return false;
                }
            },
            fetchData: function () {
                // reset reviews before every call to prevent rendering issues
                this.Reviews = null;

                this.$http.get(this.purl + '/reviews/data?productId=' + this.pid, {}).then((response) => {
	                var data = response.data;
                    if (this.hasValue(data) &&
                        this.hasValue(data.Status) &&
                        data.Status == 'success' &&
                        this.hasValue(data.Data) &&
                        this.hasValue(data.Data.Reviews)) {

                        this.Reviews = data.Data.Reviews;
                    }
                    else {
                        this.Reviews = null;
                    }
                });
            },
            formatDate: function (dateField) {
                if (!dateField) {
                    return;
                }

                var dateLabel = '';
                var match = dateField.match(/Date\((.*)\)/);

                if (match && match.length) {
                    dateLabel = moment(match[1], 'x').format('MMM D, YYYY');
                }

                return dateLabel;
            },
            getRating: function (value) {
                if (!value) {
                    return null;
                }

                return Math.round(Math.abs(value) / 20);
            }
        },
        watch: {
            updateIteration: function () {
                this.fetchData();
            }
        },
        created: function () {
            var scriptElement = rootElement.querySelector('script[purl]');
            this.purl = scriptElement === null ? [] : JSON.parse(scriptElement.innerHTML).purl;
            this.pid = scriptElement === null ? [] : JSON.parse(scriptElement.innerHTML).pid;
            this.fetchData();
        }
    });
}

