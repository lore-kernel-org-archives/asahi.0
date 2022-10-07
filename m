Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5901A2F58
	for <asahi@lists.linux.dev>; Fri,  7 Oct 2022 20:37:21 +0000 (UTC)
Received: from localhost.localdomain (95.49.30.201.neoplus.adsl.tpnet.pl [95.49.30.201])
	by m-r2.th.seeweb.it (Postfix) with ESMTPA id 5D0963F358;
	Fri,  7 Oct 2022 22:00:44 +0200 (CEST)
From: Konrad Dybcio <konrad.dybcio@somainline.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: martin.botka@somainline.org,
	angelogioacchino.delregno@somainline.org,
	marijn.suijten@somainline.org,
	jamipkettunen@somainline.org,
	Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v4 0/2] A7-A11 AIC support
Date: Fri,  7 Oct 2022 22:00:20 +0200
Message-Id: <20221007200022.22844-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Limit some later-introduced features in the AIC driver to make it work
for older Apple Silicon.

Changes since v3:
- Add cover letter :)

- Bindings: A7-A10+M1 only get SoC compat and generic fallback,
A11 gets M1 fallback and generic fallback (removed A11 compatible)
- Drop Rob's A-b as this is essentially yet another rewrite..

- Replace use_fast_ipi with has_uncore_ipi_regs in aic_init_cpu
(logic error, this was written to regardless of FIPI usage before,
but touching Sn_... regs on SoCs that don't explicitly use them for
IPIs makes them sepuku..)
- Drop A11 compatible

Konrad Dybcio (2):
  dt-bindings: apple,aic: Document A7-A11 compatibles
  irqchip/apple-aic: Add support for A7-A11 SoCs

 .../interrupt-controller/apple,aic.yaml       | 16 +++++--
 drivers/irqchip/irq-apple-aic.c               | 47 +++++++++++++------
 2 files changed, 45 insertions(+), 18 deletions(-)

-- 
2.37.3

