# 网站维护手册

站点文件夹：`portfolio/cchen744.github.io/`
- `index.html` — 所有文字内容和结构
- `style.css` — 样式（配色、字体、布局）
- `script.js` — 滚动动画，一般不用改
- `images/` — 图片素材

---

## 一、现在要做的事：把网站发布上线

网站文件已经好了，但还没推到 GitHub，所以现在访问不了。步骤：

1. **先推 5 个项目仓库**（如果还没推过）：
   ```bash
   cd "portfolio"
   ./PUSH_TO_GITHUB.sh
   ```
   这样 index.html 里那些 `github.com/cchen744/xxx` 链接才不会 404。

2. **再推网站本身**（仓库名必须是 `cchen744.github.io`，GitHub Pages 才会自动识别）：
   ```bash
   cd "portfolio/cchen744.github.io"
   ./PUSH_TO_GITHUB.sh
   ```
   如果没装 `gh` CLI，脚本会提示你先在 github.com 手动建一个空仓库 `cchen744.github.io`，建完按回车继续。

3. 去仓库 Settings → Pages，Source 选 `main` 分支 `/ (root)`。等 1-2 分钟，网站就在 `https://cchen744.github.io` 上线了。

之后每次改完内容，重新在 `cchen744.github.io` 文件夹里跑：
```bash
git add .
git commit -m "更新说明"
git push
```
不需要重跑 `PUSH_TO_GITHUB.sh`（那个是首次建仓库用的）。

---

## 二、加一个新项目

在 `index.html` 里找到 `<div class="project-grid">`，复制其中一张卡片的完整代码块（从 `<article class="card">` 到对应的 `</article>`），粘贴在同一个 `project-grid` 里，然后改这几处：

```html
<article class="card">
  <div class="card-thumb placeholder"><span>你的图片说明文字</span></div>
  <div class="card-body">
    <p class="kicker">技术标签，比如 scikit-learn · Rasterio</p>
    <h3>项目标题</h3>
    <p>一两句话描述项目做了什么、用了什么数据、有什么结果。</p>
    <div class="tags">
      <span>Python</span><span>其他库</span>
    </div>
    <a class="card-link" href="https://github.com/cchen744/仓库名" target="_blank" rel="noopener">View repo →</a>
  </div>
</article>
```

- `card-thumb placeholder` 是灰色斜纹占位图，想换真实图片见下一节。
- 记得把 `github.com/cchen744/仓库名` 换成实际仓库地址，仓库要先推到 GitHub 否则链接是死的。

---

## 三、换图片 / 加真实缩略图

现在只有"卫星遥感"那张卡片用了真图（`images/landsat-timelapse.gif`），其余是占位图。想换成真图：

1. 把图片文件放进 `portfolio/cchen744.github.io/images/` 文件夹（建议 jpg/png/gif，控制在 1-2MB 以内，太大加载慢）。

2. 把对应卡片的这一行：
   ```html
   <div class="card-thumb placeholder"><span>k-means clusters, NYC</span></div>
   ```
   换成：
   ```html
   <div class="card-thumb">
     <img src="images/你的文件名.png" alt="图片描述（给屏幕阅读器用）">
   </div>
   ```
   注意去掉 `placeholder` 这个 class，不然占位底纹还在。

3. 图片会自动裁切填满卡片（`object-fit: cover`），不用自己调尺寸。

---

## 四、改文字内容

都在 `index.html` 里，直接找对应文字改就行：

| 想改什么 | 找哪个部分 |
|---|---|
| 姓名/一句话定位 | `<section class="hero">` 里的 `<h1>` 和 `.hero-tagline` |
| 自我介绍 | `<section id="about">` 里的 `<p>` |
| 技能列表 | `<section id="skills">` 里的 `.skill-group` |
| 联系方式 | `<section id="contact">` 里的 `.contact-links` |
| 项目描述/技术标签 | 对应 `<article class="card">` 里的 `<p>` 和 `.tags` |

## 五、改配色/字体

在 `style.css` 最上面的 `:root { ... }` 里，改这几个变量就会全站生效：
```css
--bg: #F7F4EA;      /* 背景色 */
--blue: #4E90F5;    /* 主色调（按钮、链接） */
--olive: #4B6B03;   /* 强调色 */
```

## 六、改完之后本地先看一眼

在 `cchen744.github.io` 文件夹里跑：
```bash
python3 -m http.server 8000
```
浏览器打开 `http://localhost:8000` 预览，没问题再 git push。

---

## 遇到问题找我

改的时候如果要加新项目/换很多图，直接把新内容和图片发给我，我帮你改代码、检查链接和格式，比自己手改快很多。
