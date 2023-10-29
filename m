Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851C3610A
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 07:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="KFdXOaZd"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id D750942699;
	Sun, 29 Oct 2023 07:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1698563359; bh=R1/ij1xn3qoay0zcqhigpB4xRnUemNR3rVgbqRUep4E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KFdXOaZdm6cKqWZl/AE1Qhg2kPnR4CJq4kzD91KLexPNM13phjNNrNlGcreQeUTnN
	 UWN7u757jjN46HjqeYIdhoFqdug0pyQWShGdna+oO+cYLKXQbUlWHrPXG74PHw5HvN
	 3yPppjKYGB14l71+YPyR0wuc+YU3H/PQIXKJ3kpvoTEeedzLwIRimMfdJVEgKsBFdR
	 2Z4AoL1u2jlK/vG6GusC8X273QUswTHraeu6vvFItw6NNfiS9HN5tUQgD1+Cq/1/v/
	 ULiJGHfeu4B+Tk0PUlkq6IaG0G3e2i8SUe3S6utoxfhHjI5bJjvOyNvL93ARi/y8NJ
	 fqrlCEDoWeAaQ==
From: Hector Martin <marcan@marcan.st>
Date: Sun, 29 Oct 2023 16:09:09 +0900
Subject: [PATCH 2/2] usb: hub: Add missing reset recovery delay
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231029-usb-fixes-2-v1-2-9f793aa20fe4@marcan.st>
References: <20231029-usb-fixes-2-v1-0-9f793aa20fe4@marcan.st>
In-Reply-To: <20231029-usb-fixes-2-v1-0-9f793aa20fe4@marcan.st>
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>, 
 u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=757; i=marcan@marcan.st;
 h=from:subject:message-id; bh=R1/ij1xn3qoay0zcqhigpB4xRnUemNR3rVgbqRUep4E=;
 b=owGbwMvMwCEm+yP4NEe/cRLjabUkhlQ7VvEfFoIVkmn/LyXMti7lZ+AXfDHlePiq+akdCpd6/
 jKkNoR2lLIwiHEwyIopsjSe6D3V7Tn9nLpqynSYOaxMIEMYuDgFYCKv2xgZFv+cfF6IN8bgxMcp
 5ral8SK5b34HPN9VJ/Tbe6naP88nvxkZ/iYUmATm89i3d+rq8Sgk1U5yDTplwzmVxeH7m893Tvx
 gBQA=
X-Developer-Key: i=marcan@marcan.st; a=openpgp;
 fpr=FC18F00317968B7BE86201CBE22A629A4C515DD5

Some devices like YubiKeys need more time before SET_ADDRESS. The spec
says we need to wait 10ms.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 common/usb_hub.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/common/usb_hub.c b/common/usb_hub.c
index ba11a188ca64..858ada0f73be 100644
--- a/common/usb_hub.c
+++ b/common/usb_hub.c
@@ -391,6 +391,13 @@ int usb_hub_port_connect_change(struct usb_device *dev, int port)
 		break;
 	}
 
+	/*
+	 * USB 2.0 7.1.7.5: devices must be able to accept a SetAddress()
+	 * request (refer to Section 11.24.2 and Section 9.4 respectively)
+	 * after the reset recovery time 10 ms
+	 */
+	mdelay(10);
+
 #if CONFIG_IS_ENABLED(DM_USB)
 	struct udevice *child;
 

-- 
2.41.0

