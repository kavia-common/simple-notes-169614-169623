(function () {
  // Delegate button click for "Get Started"
  document.addEventListener('click', function (e) {
    const target = e.target;
    const btn = target.closest && target.closest('.get-started-btn');
    if (btn) {
      // Placeholder for interaction - no interactions specified in JSON
      console.log('Get Started clicked');
    }
  });
})();
