Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E1E6AB5
	for <asahi@lists.linux.dev>; Fri, 21 Oct 2022 23:55:53 +0000 (UTC)
Received: from localhost.localdomain (95.49.29.134.neoplus.adsl.tpnet.pl [95.49.29.134])
	by m-r2.th.seeweb.it (Postfix) with ESMTPA id E35D03F3EF;
	Sat, 22 Oct 2022 01:55:44 +0200 (CEST)
From: Konrad Dybcio <konrad.dybcio@somainline.org>
To: asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] irqchip/apple-aic: Mark aic_info structs __initconst
Date: Sat, 22 Oct 2022 01:55:23 +0200
Message-Id: <20221021235523.76585-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These structs hold information used only at init time that never
gets modified, hence mark them __initconst.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/irqchip/irq-apple-aic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index 1c2813ad8bbe..ae3437f03e6c 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -248,14 +248,14 @@ struct aic_info {
 	bool fast_ipi;
 };
 
-static const struct aic_info aic1_info = {
+static const struct aic_info aic1_info __initconst = {
 	.version	= 1,
 
 	.event		= AIC_EVENT,
 	.target_cpu	= AIC_TARGET_CPU,
 };
 
-static const struct aic_info aic1_fipi_info = {
+static const struct aic_info aic1_fipi_info __initconst = {
 	.version	= 1,
 
 	.event		= AIC_EVENT,
@@ -264,7 +264,7 @@ static const struct aic_info aic1_fipi_info = {
 	.fast_ipi	= true,
 };
 
-static const struct aic_info aic2_info = {
+static const struct aic_info aic2_info __initconst = {
 	.version	= 2,
 
 	.irq_cfg	= AIC2_IRQ_CFG,
-- 
2.38.1

