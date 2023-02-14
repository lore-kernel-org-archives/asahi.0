Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766B410793
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 10:38:06 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 286EA26F78D;
	Tue, 14 Feb 2023 11:38:04 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH 0/2] Apple M2 PMU support
Date: Tue, 14 Feb 2023 11:38:00 +0100
Message-Id: <20230214-apple_m2_pmu-v1-0-9c9213ab9b63@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIhk62MC/x2NWwqDMBAAryL73S1mjQ30KkUkj21dqGlIaCiId
 zf2cxiG2aBwFi5w7zbIXKXIJzZQlw78YuOLUUJjoJ6GnpRGm9Kb55XmtH5RmdGZ0RsdNENLnC2
 MLtvolzOqtyth4HqqlPkpv//pMe37AQ2MHm15AAAA
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=813; i=j@jannau.net;
 h=from:subject:message-id; bh=6ru8iQ5LCW/8mNAI4eO7Y6weTX2bPkbyoSgZJN5ox68=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuTXKd2iV097P1cIfbH2uE72HpWup+x2KjtfuxZNXpEvs
 c3WcW52RykLgxgHg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIlEizMy3DfYzBm9SqbTyUfW
 4cKc+XMWMy1zilaTEgo+y5vo3On7iOF/xuHyvWWH92TtuRj4ZdHRtPP+GnJdf7Z8mPJmjnKNpgk
 HPwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

This small series adds support for the PMU in Apple M2 cores. The PMU
itself appears to work in the same way as om M1. We still want to add
CPU type specific compatible strings so that we can distinguish counters
in the case they count (slightly) different things on different CPU
uarchs.

Signed-off-by: Janne Grunau <j@jannau.net>
---
Janne Grunau (2):
      dt-bindings: arm-pmu: Add PMU compatible strings for Apple M2 cores
      drivers/perf: apple_m1: Add Apple M2 support

 Documentation/devicetree/bindings/arm/pmu.yaml |  2 ++
 drivers/perf/apple_m1_cpu_pmu.c                | 14 ++++++++++++++
 2 files changed, 16 insertions(+)
---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230214-apple_m2_pmu-175b75c74d4e

Best regards,
-- 
Janne Grunau <j@jannau.net>

