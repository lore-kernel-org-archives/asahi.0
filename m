Received: from chaosmail.localdomain (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B384036D9F8
	for <asahi@lists.linux.dev>; Sat, 11 Apr 2026 14:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775918205; cv=none; b=f/6omsjVD50mmHlRleRXJoA2ewMozbkv8yoIpqiJ4hkVhiHSV6LrX8zBpor55QDLm3i3FY+iOaZp1F+TDGGPNVzwyLbhf+4D7RNN3bGNtvf5n/x0wuwtVznn7QE4Zv7bn7RjjR9e+xQosEbGjYQrTJxedDVQ17apVig2oOzsWEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775918205; c=relaxed/simple;
	bh=xWA9tRPbt2UAwLNrmP907pWdebtRj7qMHJicLvv2LLY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pvq6cpZE7QYFmHg0oHt1U24azHYRnE6/NUtN+jm1Xfe+WuuxJzfuz9YWAsMPeS6pkTYIuJ1XMmeSFht7RYWQN8o0Hpv+ud469fdtOsFM3F322rh7lrMS+8w0uFcitOjlpU2OF4ZZCz4XUPhYBpIIwVn4h05PIbV1kPNx6tcK2YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=U3TAyjyj; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="U3TAyjyj"
Received: by chaosmail.localdomain (Postfix) with ESMTPSA id 2ACCC1CC18F;
	Sat, 11 Apr 2026 14:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1775918195;
	bh=isYF04DeVAOh4RSzlFn9SyK9i3A+jI1wtH8mkn3Al8g=;
	h=From:Subject:Date:To:Cc;
	b=U3TAyjyj0YArH0WBTqgVhDL84yVi+X5lI/KH7vt3jTlU18l04OB0OjvrzG9PU3UKS
	 CB6giIXTP9tfduZpDdHhz2di1aopVPbUG6t4eX81/ueeIQVCJ/OELl9AOs422m5HHU
	 /Wc2PZ1Dlf/O56gAvP5Ao+nmGxOoSL+rgUjV2EE4=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH 0/2] Update Sasha Finkelstein's email address
Date: Sat, 11 Apr 2026 16:36:06 +0200
Message-Id: <20260411-mailmap-v1-0-5a519f7b00b5@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0MD3dzEzJzcxAJdc0tT4yRjIyMDA4NEJaDqgqLUtMwKsEnRsbW1AM8
 D7AdZAAAA
X-Change-ID: 20260410-mailmap-7953b322000a
To: Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775918195; l=1302;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=xWA9tRPbt2UAwLNrmP907pWdebtRj7qMHJicLvv2LLY=;
 b=aBCnUjhiARiHRvV7CvusupiG3TrAOIAy/5mBzNtQm9i/SDHGdpNzzaF67xdOH4fk4TjB8zCNa
 30ep5fjX34UCG+0wKVrexbrB2FmsVcK1pJHtz9NPTXrNRaOhCq1HEaS
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Moving away from gmail

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Sasha Finkelstein (2):
      mailmap: Update Sasha Finkelstein's email address
      dt-bindings: Update Sasha Finkelstein's email address

 .mailmap                                                                     | 1 +
 Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml    | 2 +-
 Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml         | 2 +-
 Documentation/devicetree/bindings/display/panel/apple,summit.yaml            | 2 +-
 Documentation/devicetree/bindings/gpu/apple,agx.yaml                         | 2 +-
 Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml | 2 +-
 Documentation/devicetree/bindings/nvmem/apple,spmi-nvmem.yaml                | 2 +-
 Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml                    | 2 +-
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml                       | 2 +-
 MAINTAINERS                                                                  | 2 +-
 10 files changed, 10 insertions(+), 9 deletions(-)
---
base-commit: 7c6c4ed80b874f721bc7c2c937e098c56e37d2f0
change-id: 20260410-mailmap-7953b322000a

Best regards,
-- 
Sasha Finkelstein <k@chaosmail.tech>

