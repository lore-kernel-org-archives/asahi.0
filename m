Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4C08F5D
	for <asahi@lists.linux.dev>; Mon, 28 Nov 2022 16:23:10 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 1E60B320094D;
	Mon, 28 Nov 2022 11:23:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 28 Nov 2022 11:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1669652588; x=1669738988; bh=uWr9BsF5eX
	VkjF1lihfNadM8eLlnHm/DZvhOmYHJ7fM=; b=jZXbponIVf1yUF32HALm/So70R
	rISSObGj4jgPDy93wzxCditX9XRRVQZtVB3EVKT5RPH3Z+pnzAus5cQUXx4pq5fy
	XE0Q9OBAtCuUu6DbmRXKjaNpK5CUc72qVzONqOn6Mg6KzJxb/RR152lgEnt1Wb+d
	BueJQoEY/eSBXT2WDs2V039y/2qOgGF/qFDrneUKK5OCGz48nneRE60uc07rSK8V
	qtX67wg4iySsqDzFdpxp3eu22c/7ew97uJ7inYPMcnTfqjZ247wrQYWxWc5Qa9Bh
	ffVIomW0sHzpX/O+WyFznLTLhbTwHhWzkYAKSYlwu1XD/nf3zpTdkoJqhI3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1669652588; x=1669738988; bh=uWr9BsF5eXVkjF1lihfNadM8eLlnHm/DZvh
	OmYHJ7fM=; b=Pc6gXiIq7s46GiP1ajhamIfDFABRpEHXlxrOwQtSjWz/eedlisc
	1EE8EGB83NBQPcmzLBzqfxuEML1GEiH8fwGyEsCKavPbkpGfEy5P0r/Z2B7p0t/f
	IrGnWXZk3RMZJgnGuJWm00S5iMpaIY6dNw+6WAmaV0aeuRAefDnohpi1JuJ9pOuS
	pqucN5NDMXRsavqBXRoKeELtYbbRKdNBETYhCVVWckb5pTb1nf56tCY6gZgsPRIL
	VsWVyuVhB0nYY6sB3TC3ZmQJcPYUGgVS6IQ05gSsT2CEb+MedjSRrzGkc0UmSkKr
	7zXN2k8vTlE7LYfYxyL1U0COJSNevxbJ0qg==
X-ME-Sender: <xms:bOCEY0Ot0qe90YmkMMzSDie__c-KFCmea3WFWpLbwrwGe1FnhEKJrA>
    <xme:bOCEY68TGNjBHcnG0j52GiRnXaaXpwYermf-jlRRxIH1sG17DIryAoWM7ue_r_UdE
    Z2ou5g5lDPQ9lGbnPs>
X-ME-Received: <xmr:bOCEY7Tzo4IXxrUrWy4Mn-XLV6LquT0I4tHh-X5EIibNSce9wwbNizIiUFOk8e92jTRU5nEXD7TcYFfBufLk1sYTcytwQjup0uxWwDasgSJc54bKu4AWiurYlWLlfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedvgdeklecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcurfgv
    thgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epleduffeiheeuvedtffevtdeuleeljeduudfgtedtvefhfeffvdfghfejhefgleelnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvghnse
    hsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:bOCEY8vnlfP7q15aBzAG3tPfYSJEEB8xBIVhKh9D8RykcYJin_9-PQ>
    <xmx:bOCEY8fXe1r7cJou_5Mo6XFV-703e9HvS9c2PliUlR9210DAQmmr7Q>
    <xmx:bOCEYw1G8sgFmw1xBCKPDoBQNDoxcVPLIWv2ydraQs_Q4uHLvrsmsg>
    <xmx:bOCEY75Uxr71Z49l8B9OTzCf58C_E5ZfEUI3T3guOYusScrchmL75A>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 11:23:07 -0500 (EST)
From: Sven Peter <sven@svenpeter.dev>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sven Peter <sven@svenpeter.dev>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: [PATCH] usb: typec: tipd: Set mode of operation for USB Type-C connector
Date: Mon, 28 Nov 2022 17:23:04 +0100
Message-Id: <20221128162304.80125-1-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Forward the mode of operation to the typec subsystem such that it can
configure the mux correctly.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/usb/typec/tipd/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 982bd2cad931..46a4d8b128f0 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -14,6 +14,7 @@
 #include <linux/regmap.h>
 #include <linux/interrupt.h>
 #include <linux/usb/typec.h>
+#include <linux/usb/typec_altmode.h>
 #include <linux/usb/role.h>
 
 #include "tps6598x.h"
@@ -257,6 +258,7 @@ static int tps6598x_connect(struct tps6598x *tps, u32 status)
 		typec_set_orientation(tps->port, TYPEC_ORIENTATION_REVERSE);
 	else
 		typec_set_orientation(tps->port, TYPEC_ORIENTATION_NORMAL);
+	typec_set_mode(tps->port, TYPEC_STATE_USB);
 	tps6598x_set_data_role(tps, TPS_STATUS_TO_TYPEC_DATAROLE(status), true);
 
 	tps->partner = typec_register_partner(tps->port, &desc);
@@ -280,6 +282,7 @@ static void tps6598x_disconnect(struct tps6598x *tps, u32 status)
 	typec_set_pwr_role(tps->port, TPS_STATUS_TO_TYPEC_PORTROLE(status));
 	typec_set_vconn_role(tps->port, TPS_STATUS_TO_TYPEC_VCONN(status));
 	typec_set_orientation(tps->port, TYPEC_ORIENTATION_NONE);
+	typec_set_mode(tps->port, TYPEC_STATE_SAFE);
 	tps6598x_set_data_role(tps, TPS_STATUS_TO_TYPEC_DATAROLE(status), false);
 
 	power_supply_changed(tps->psy);
-- 
2.25.1

