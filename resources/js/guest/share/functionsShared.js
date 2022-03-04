import vue from "vue";

export default vue.observable({
    formatDate(date) {
        let formattedDate = {};
        let array = [];
        array = date.split("T");
        formattedDate["date"] = array[0];
        formattedDate["hour"] = array[1].slice(0, 5);
        return formattedDate;
    },
});
