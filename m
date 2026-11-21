Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795250081;
	b=HPyuUME/Ne75NtR1NW3Lz39Zgw3Aau6iUdXzTTRd3imXS+asue9pw+Q2+/s1Wmgomj0c
	 vzFgwLyyEyGBqQnNz6/MpdyCHUasrTjfgYsCmUANB/rynPCpoenLjnZfEb7+3QlZ7NQZN
	 7STOG4OQ74CPhI56IEiMm9JG5LfRYIB9PDDDG/mj13vUGYqrFjc8MUegFzoyzQTBl8rUs
	 sI974oAUKMr+OWqjI0Tm6BgqSToQecDNbYkG6TzM32cRK95i9ZwBN21rtBZjt2lExeOEl
	 CAfOTocqC+zzJeuitDuEBESP/2YmkREWtsQljG0etXjhSfktibxKhRc5vR09fwp68PQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795250081;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=HAkJxAX20g31S84MwL+T20cT/G9unmHCFzI7v//wRU0=;
	b=xKQa4jmYAwZ9Tf4owWmzkvcdlA0wfoqyun8up/8wpwo8+Ew3aazKOlQ1fndE5AXcxk/C
	 Xs9HYyonuN+IX/pqGOZsUd5OQjpITXrLMmnjOVZnPCEtSx3TUANb49sdLKK6UN6yU0dW+
	 NXExKb3AxVGfSsT61J68+VX2yM1FjoG7iqedwHNJvhBZ/UL3OCclnOo0ADXUJbsM5Uyoy
	 +f/jfd9ORyghGKqdyRakeAMaIgKzMWoHaBynFl69jOkx6TnhEGJY433xdz6Z86sza8O7r
	 c74ln8rkUJr6P1YrCHxwOCvBiefyXgy7cIEL+cH4VBc6BVcv/ckH5Z0xs/9p7dw6ZJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="IWkXc/yP";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FC0606A320;
	Sat, 21 Nov 2026 08:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IWkXc/yP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795250080;
	b=pR8qSPiD5JnVbh9S6MZPEMwQg9iBlp0Q9G/ouEjeNSe26BsdS/dIP0T0PGSvkPJXKeK6
	 mAUnAG1VnNgGfoQ6IvCI2Xu0pzRRJK/xm39HlZ2I4DcPoBVV0BABUtJ2tgYF73slYqGkw
	 9JAwkGxKlbWKsZZRETOSI3xXLH1aMNfizNkhYDow6Xq8cfMAkj2LlubwX4zFOTs5pJ2rK
	 4XbueYTv4Dkk79F+1pKY7AH5jC0QQjGTp//a0KaZMox83dXepfNPkrFz1UIVsZIRAYi9i
	 wyftva5LBb2Zvz+4QYIjHTGtDxK6XXyxqq5DrLPjKHkr4utvEpGSXNHJ+dkxhHsAGQA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795250080;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=HAkJxAX20g31S84MwL+T20cT/G9unmHCFzI7v//wRU0=;
	b=PSdsSlLFKRkEb21dft5JOC7idlXwsBIxeI6ak/qNUrIGdq4mcLZcGoePLnhraCYWtq0W
	 1mnB4ara+gKoDYtSjSpy53i0y5g8FWMMWRixiZg3soLyZ/+iNiliHdghxnMPcq2HUzETX
	 iGvBlFld4SXLhUJYhxo26FeWTYxHApO4VxNdq6iP9zMKKplrDX258vHNSDqQBiPErL/cg
	 Th42l62IwRuVa0LJ8VJO4yCkUq4AFmuYzuko0qBtaHzlw3SXFjIrPUyWg2O8EwAOEsWyS
	 L+CG+cBCL5nljYZ5st6u0GN+BN9p9uTaqomaQ9/GbU3jZ0mMXiS2whFTWYFKlXZrURA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DD9841F000CA;
	Sat, 21 Nov 2026 08:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795250080;
	bh=HAkJxAX20g31S84MwL+T20cT/G9unmHCFzI7v//wRU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IWkXc/yP2F8tF/mD+lIGntWflg4i++u9Nylk73AQ3PR7u9ZydfUfcxk+t8K0X0M4o
	 qbnwaN6sc3+WBu1c8v8lOwQOAdsJSg5oejHftnkEfZTIBPpWQa2FMl/pgd/A0JrWWU
	 75XLPSpu1nKv/9uN3MJWhnYbMJ6tUHdodWY8boHvzoI+gq/GvSZTh/R3/Y4vQxk8u/
	 c/Ac3z+dLP8O5AEGLqCf0fVImQm4BVpZbU5eBzpqasm6z/i+zDim7dEjPvePwsm3Ho
	 n1zxgwb92FTsTG6MKFM6z0Gf3BO5o+8HPfcqYo+JYlnlziFKQAv9CeWBIQBSGRYSoM
	 jIasrAAAENgLQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 602304BB60;
	Sat, 21 Nov 2026 08:34:39 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 08:34:15 +0000
Subject: [PATCH 1/4] dt-bindings: spmi: apple,spmi: Add t8122-spmi
 compatible
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-t8122-smc-dt-v1-1-898f3f5d6228@gmail.com>
References: <20261121-t8122-smc-dt-v1-0-898f3f5d6228@gmail.com>
In-Reply-To: <20261121-t8122-smc-dt-v1-0-898f3f5d6228@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>, 
 Lee Jones <lee@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795250077; l=905;
 i=michael.reeves077@gmail.com; s=20261107; h=from:subject:message-id;
 bh=sdZqNboDueIqd/3+ZQB+YhZSKVMgBeFIQ/ArGmXfVBM=;
 b=O4/enfcuMGARRASodcI6u0D0M9IR6lwZh6J7hjydbof0yWVKLg1sIcj5RoEkM0m7hcFjsXH2l
 nsOrw2docFPB2VQB24U1WC4Ac2eJywciqkbpGeAdELfEzPNeH05s0gs
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=ykwkLcuByJYb/cdLc2UuoYP03pIzwrscEZg30+4tJL8=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20261107
 with auth_id=1442
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
Reply-To: michael.reeves077@gmail.com

From: Sasha Finkelstein <k@chaosmail.tech>

Add the apple,t8122-spmi compatible for the SPMI controller on the Apple
M3 (T8122) SoC, which is compatible with apple,t8103-spmi.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index 3e5b14bc8c31..f7920dd3a59b 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -22,6 +22,7 @@ properties:
               - apple,t6020-spmi
               - apple,t8012-spmi
               - apple,t8015-spmi
+              - apple,t8122-spmi
           - const: apple,t8103-spmi
       - items:
           - enum:

-- 
2.56.0


