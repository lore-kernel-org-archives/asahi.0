Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0CA107BA
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:04:07 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id F2ED226F7A0;
	Tue, 14 Feb 2023 12:04:05 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Date: Tue, 14 Feb 2023 12:03:25 +0100
Subject: [PATCH v2 12/16] dt-bindings: clock: apple,nco: Add t8112-nco
 compatible
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230202-asahi-t8112-dt-v2-12-22926a283d92@jannau.net>
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
In-Reply-To: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=791; i=j@jannau.net;
 h=from:subject:message-id; bh=1hLQKr1TFa1AEZml9DhrRWIZKNnsrVis9H562BExj3c=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuTXWfMzryVHm8a76vU9mfKnXnuSzFvFvQqCc9+u/Gj7a
 LpdzaPHHaUsDGIcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACay/THDP4v6Fz9nHqrk27Vg
 RxBHrnzPj4Uf55zyrzv359/GZUm66Q8ZGR6lxgkJLl2f7bf872XZ9yHcu1ds+e3D9S/RdqbtkVe
 n0lgA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The block found on Apple's M2 SoC is compatible with the existing driver
so add its per-SoC compatible.

Acked-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/clock/apple,nco.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/apple,nco.yaml b/Documentation/devicetree/bindings/clock/apple,nco.yaml
index 74eab5c0d24a..8b8411dc42f6 100644
--- a/Documentation/devicetree/bindings/clock/apple,nco.yaml
+++ b/Documentation/devicetree/bindings/clock/apple,nco.yaml
@@ -23,6 +23,7 @@ properties:
       - enum:
           - apple,t6000-nco
           - apple,t8103-nco
+          - apple,t8112-nco
       - const: apple,nco
 
   clocks:

-- 
2.39.1

