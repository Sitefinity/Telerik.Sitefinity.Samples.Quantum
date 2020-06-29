import { initializeComponent } from "../functions/init";
import store from '../store';

initializeComponent("review-form", initReviewForm);

function initReviewForm(rootElement) {
    new Vue({
        el: '#' + rootElement.id,
        store,
        props: ['purl', 'pid', 'cid', 'cgid'],
        data: {
            rating: null,
            comments: '',
            userName: '',
            userEmail: ''
        },
        props: [
            'star1',
            'star2',
            'star3',
            'star4',
            'star5',
        ],
        methods: {
            setRating: function (rating) {
                this.rating = rating;
            },
            submit: function () {
                var requestData = {
                    Rating: this.rating,
                    Name: this.userName,
                    Email: this.userEmail,
                    Comments: this.comments,
                    ProductId: this.pid,
                    CategoryId: this.cid,
                    CatalogGroupId: this.cgid
                };

                this.$http.post(this.purl + '/reviews/add', requestData).then((response) => {
                    if (response.data) {
                        var data = response.data;
                        this.$store.commit('update');

                        this.rating = null;
                        this.comments = '';
                        this.userName = '';
                        this.userEmail = '';
                    }
                });
            }
        },
        watch: {
            rating: function (value) {
                for (var i = 1; i <= 5; i++) {
                    if (i <= value) {
                        this['star' + i] = 'star on';
                    }
                    else {
                        this['star' + i] = 'star';
                    }
                }
            }
        },
        created: function () {
            var scriptElement = rootElement.querySelector('script[purl]');
            this.purl = scriptElement === null ? [] : JSON.parse(scriptElement.innerHTML).purl;
            this.pid = scriptElement === null ? [] : JSON.parse(scriptElement.innerHTML).pid;
            this.cid = scriptElement === null ? [] : JSON.parse(scriptElement.innerHTML).cid;
            this.cgid = scriptElement === null ? [] : JSON.parse(scriptElement.innerHTML).cgid;
            this.setRating(0);
        }
    });
}




