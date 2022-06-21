Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B68A56
	for <asahi@lists.linux.dev>; Tue, 21 Jun 2022 07:25:29 +0000 (UTC)
Received: from coburn.home.jannau.net (p579ad988.dip0.t-ipconnect.de [87.154.217.136])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 7E63126ED18;
	Tue, 21 Jun 2022 09:18:50 +0200 (CEST)
From: Janne Grunau <j@jannau.net>
To: iommu@lists.linux-foundation.org
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
	asahi@lists.linux.dev,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Hector Martin <marcan@marcan.st>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] iommu/io-pgtable: Add DART subpage protection support
Date: Tue, 21 Jun 2022 09:18:46 +0200
Message-Id: <20220621071848.14834-4-j@jannau.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220621071848.14834-1-j@jannau.net>
References: <20220621071848.14834-1-j@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sven Peter <sven@svenpeter.dev>

DART allows to only expose a subpage to the device. While this is an
optional feature on the M1 DARTs the new ones present on the Pro/Max
models require this field in every PTE.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Janne Grunau <j@jannau.net>

---

Changes in v3:
- apply change to io-pgtable-dart.c

 drivers/iommu/io-pgtable-dart.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iommu/io-pgtable-dart.c b/drivers/iommu/io-pgtable-dart.c
index 0c5222942c65..fa8025c03bb5 100644
--- a/drivers/iommu/io-pgtable-dart.c
+++ b/drivers/iommu/io-pgtable-dart.c
@@ -14,6 +14,7 @@
 #define pr_fmt(fmt)	"dart io-pgtable: " fmt
 
 #include <linux/atomic.h>
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/io-pgtable.h>
 #include <linux/kernel.h>
@@ -63,6 +64,9 @@
 /* Calculate the block/page mapping size at level l for pagetable in d. */
 #define DART_BLOCK_SIZE(l, d)	(1ULL << DART_LVL_SHIFT(l, d))
 
+#define APPLE_DART_PTE_SUBPAGE_START   GENMASK_ULL(63, 52)
+#define APPLE_DART_PTE_SUBPAGE_END     GENMASK_ULL(51, 40)
+
 #define APPLE_DART1_PADDR_MASK	GENMASK_ULL(35, 12)
 
 /* Apple DART1 protection bits */
@@ -140,6 +144,10 @@ static void __dart_init_pte(struct dart_io_pgtable *data,
 
 	pte |= APPLE_DART_PTE_VALID;
 
+	/* subpage protection: always allow access to the entire page */
+	pte |= FIELD_PREP(APPLE_DART_PTE_SUBPAGE_START, 0);
+	pte |= FIELD_PREP(APPLE_DART_PTE_SUBPAGE_END, 0xfff);
+
 	for (i = 0; i < num_entries; i++)
 		ptep[i] = pte | paddr_to_iopte(paddr + i * sz, data);
 }
-- 
2.35.1

