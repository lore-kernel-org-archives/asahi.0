Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795250081;
	b=kC3bKVb/RD8C2nLUtI+fWhfKlr7qNYSFaYQv6XrUeOXp/vl+anWHYOY7UHYRtpquoUjZ
	 cE+dNm9oe0FyotOgRMubAgfA2kYhkjImvuY4E4PhX55yRf/FlP2gWXu7DRZ4q2O/JZhfw
	 7a25j3O63iKTWe7ttV5ND2qPHtMKlE5hjCgrMl/QkuLmA7PBTFnyPOnarqDmZ+9gOIhX/
	 KHT/VAtwqxTJXAn6B2rQnZW9vQdHHDJuwNpVox4HnCjdVotifb9634uynryGpSyEcKhXA
	 YqPwYEFUvrCHGMBYPv+luc+LqcgEOrHNkySD8YKRdUy2ogCKidOBbg6P8qbusjFHvRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795250081;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=lY3RZXnYKdS7JNZIMxGDLvSX/hSbpPA7qXVgH1rivdA=;
	b=IzwJ0zP7lno5SQTP+ADs1k2Cg+/xZ8iTazVcXeRULRcFhNFEz/FW4eJUZBVNXtgXXKRa
	 uv1b9UxXlkhG9zGMy9jpxcROZrfy2HRahULpvPv02yrbDC33NhJ7NqPL2QT8OULFQMiRT
	 FZWUzDMeQJzMejRooGX7u74F33uUECTvJMwTmQk7Spsm5aeistPG2GbJ72ww6eOZFEz9/
	 yrm8p2ZkLLLbalFR/dh1RdjAAsJSSm5y9oJa1djcgLibLPD1VtHk3Rd+f0Yp118u3mZEo
	 2OLLuJsKaZlPlpyrf+Y4Fz9UlTFXsCukbUeM20Jeyzbh7hm5oMQKiytMRvKi8bvZm2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mfXsunPB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C89606A332;
	Sat, 21 Nov 2026 08:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mfXsunPB
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795250080;
	b=Ktafl5LyDqbNCiCPTkpOxIjKdgvbgJhTqy6oqwkSGZVC4xwlLOfKC/qN2ucNMbilDPUB
	 YZs9pkmTasnR73gZ1gQ3gUT2ls6inJeUjf86E0zrGsh6H4AGa6S6g7W3usJtbSyMeu9Xl
	 7Qsd6bRY++OaYEYo7BvmXRLUXKuhOoLMgKJmBqUWV/hcArkDxjoSyklRAif4oYh1Qf5RQ
	 /fXD/CcBt4bSPTgvz8ayNRCMTa8mLstvMA2tJHN1X75Uf5fV+MXu9j5aOWut0Gasp1Ir/
	 bIcEnsfn2uUpCFtHP5SpDOfTwOnVX8eVWHYJvdJo/N/mmsPn6P7H0yUTV0eE2NYxBzQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795250080;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=lY3RZXnYKdS7JNZIMxGDLvSX/hSbpPA7qXVgH1rivdA=;
	b=xhxVTyEThy7OMg3s/6nWhS3fh+AR+3TCzmPTYEyWD2+ydKiEHPGarPTzuvAqmS03HHV9
	 ix3q2zXIP8j2+tgUjBJ2K4E9j/VyLvDNhsXH0O9IzoMSY4Q6PwWvVcQjuuOimRrcrSUWr
	 KMADPgBTXMdUH+AZQ60hBtC69TK6iUaFRf/Smfdkx9Gp5RhB/2nVFxuE8JBFQJRNzDxzi
	 sX/WxdoIXbccwwzdI+Gb139H5qPfJB5iBzHEwvbJLDKq2uiz8U+IhWRFOFCPnX5msya+D
	 XrqrLhU2zFErnQpZoKEIMG13van0DI1bra0PhkUGn25fARaZbZ/qUiaXQOs91h621IQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE84E1F000CF;
	Sat, 21 Nov 2026 08:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795250080;
	bh=lY3RZXnYKdS7JNZIMxGDLvSX/hSbpPA7qXVgH1rivdA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mfXsunPBsGbf/SoWd1udSgbRvpKT7mXr/bRv025/+eS0CEmspg9r1GE4PNljckgji
	 DmD0nIAD0lIYll30QmFQ9V1NLfw7Mt6M7YyeUbzADj1j6XwPx75wuW7SOGauVRIkVZ
	 kpgn9wG3ogLS37UvTIeGAIZNESepYACZDS9mQ4HZFmf5CdNUJf8d6ggm39dxxViabH
	 nOVONYcN3eI0alDb1eMIRaPSIz7xjb1si8ldPgaig35ID6F8m5trY57842Y2fMYREc
	 RfCQUG3uDE7lRl2aL0p+ZWzB4KEOl6vDM5K2qDj9hVPS50e++AWzAy56ZVc05bXikM
	 WmBMk82c4U/pg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7A4704BB97;
	Sat, 21 Nov 2026 08:34:39 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 08:34:16 +0000
Subject: [PATCH 2/4] dt-bindings: mfd: apple,smc: Add t8122-smc compatible
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
Message-Id: <20261121-t8122-smc-dt-v1-2-898f3f5d6228@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795250077; l=946;
 i=michael.reeves077@gmail.com; s=20261107; h=from:subject:message-id;
 bh=tn5lVW1FjAYmZE60s+OKJciG68xs7HiP2AZnWSAa9v8=;
 b=6kSbfAXUY6Hx8zZUZFBAQvz8WcZ4q2RQ3ZdaVS8fU/1yMEP2+nQhCgjo7LEIvIovLZAWK4ETP
 ZkucVQe7/UuAhZKcrLPTm8hvQbpXqHfSupR5JZn7IEyJRMSlrgjusZK
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=ykwkLcuByJYb/cdLc2UuoYP03pIzwrscEZg30+4tJL8=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20261107
 with auth_id=1442
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
Reply-To: michael.reeves077@gmail.com

From: Janne Grunau <j@jannau.net>

Add the apple,t8122-smc compatible for the System Management Controller
on the Apple M3 (T8122) SoC, which is compatible with apple,t8103-smc.

Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 Documentation/devicetree/bindings/mfd/apple,smc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 34ce048619f5..d5d30c053845 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -17,7 +17,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: apple,t6020-smc
+          - enum:
+              - apple,t6020-smc
+              - apple,t8122-smc
           - const: apple,t8103-smc
       - items:
           - enum:

-- 
2.56.0


