Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050CD23B0
	for <asahi@lists.linux.dev>; Sat, 31 Dec 2022 08:27:45 +0000 (UTC)
Received: from pop-os.home ([86.243.100.34])
	by smtp.orange.fr with ESMTPA
	id BWk7pnAnoSTJGBWk7p3vlM; Sat, 31 Dec 2022 08:57:30 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 31 Dec 2022 08:57:30 +0100
X-ME-IP: 86.243.100.34
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: apple: Use devm_clk_get_enabled() helper
Date: Sat, 31 Dec 2022 08:57:22 +0100
Message-Id: <6f312af6160d1e10b616c9adbd1fd8f822db964d.1672473415.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The devm_clk_get_enabled() helper:
   - calls devm_clk_get()
   - calls clk_prepare_enable() and registers what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids the need of a dedicated function used
with devm_add_action_or_reset().

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/watchdog/apple_wdt.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
index 16aca21f13d6..eddeb0fede89 100644
--- a/drivers/watchdog/apple_wdt.c
+++ b/drivers/watchdog/apple_wdt.c
@@ -136,11 +136,6 @@ static int apple_wdt_restart(struct watchdog_device *wdd, unsigned long mode,
 	return 0;
 }
 
-static void apple_wdt_clk_disable_unprepare(void *data)
-{
-	clk_disable_unprepare(data);
-}
-
 static struct watchdog_ops apple_wdt_ops = {
 	.owner = THIS_MODULE,
 	.start = apple_wdt_start,
@@ -162,7 +157,6 @@ static int apple_wdt_probe(struct platform_device *pdev)
 	struct apple_wdt *wdt;
 	struct clk *clk;
 	u32 wdt_ctrl;
-	int ret;
 
 	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
 	if (!wdt)
@@ -172,19 +166,9 @@ static int apple_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt->regs))
 		return PTR_ERR(wdt->regs);
 
-	clk = devm_clk_get(dev, NULL);
+	clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
-
-	ret = clk_prepare_enable(clk);
-	if (ret)
-		return ret;
-
-	ret = devm_add_action_or_reset(dev, apple_wdt_clk_disable_unprepare,
-				       clk);
-	if (ret)
-		return ret;
-
 	wdt->clk_rate = clk_get_rate(clk);
 	if (!wdt->clk_rate)
 		return -EINVAL;
-- 
2.34.1

