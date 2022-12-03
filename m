Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CA87B
	for <asahi@lists.linux.dev>; Sat,  3 Dec 2022 06:46:50 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d3so6542600plr.10
        for <asahi@lists.linux.dev>; Fri, 02 Dec 2022 22:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXLvXXdTgugvaqwC5VnS0gtZiRjZW9Lq1RMlH39mGsc=;
        b=Bk8IMyiJJcigVI9/tPvFR3iMFW0qALSihXCl6Q/O+2yH5AaA8bhG3wB0ZMKYLkuwPf
         UqgRpCQW2j/D6WcogjqE+MF8OCpTYarOX1z+fV5KX1ku79rTvsUPtMvCcDoSmpMOMuVz
         DI3dL5wUHZ8hL1Z11rSxjpPQWt8xIfZF2JNScYBHPcwCzvp5Z3mMBxLBwpfCmxDo0J0N
         09drmoMJtBhGX1PxvHvSXPSyRt4miHIXCM6YQKzJYCwn3e/pens4fqt9ezpMJ4QTG6jQ
         YsjGDwgy6UrHEs8KbL1brWzVcasItFUYXLi2CjqlQVPu1x4a8b3RqNAOMyo2G83hiuZN
         EPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXLvXXdTgugvaqwC5VnS0gtZiRjZW9Lq1RMlH39mGsc=;
        b=7pbO9FVjRKWNr8jkyxAljm0NquPrTwqOpXviuTU3gDfitoJd0UmQAqqo4E7eUCXwyg
         sjkOFCQwR1gZvWb1vq+j30GPnR6b/pVDm4NLbSrYp/aEZmHoQCBcT87JGvnhebTR/SdY
         1l/9/g1C0GvMSnbQg0YaRAtnn6/qTVm5AGanL3bWBJqMZu5NVEB5ZybBZ1tKJAymgx79
         qXvRZEuahY7DdQeOrLBToXq9lF0wXiyLwQeXGe4jIkPbVmc8TrDJVDkrvxBW80FboOaR
         QSTJ70Z9Bppk3/vnh3HjFzoFL8hIqNSndzoaGPiDWUXvdHyJV8zWxB0uto8UKmROmSo5
         OPyQ==
X-Gm-Message-State: ANoB5plGth7ItRe2+n7xvLIwlxwsNxzwVCXHQapp13r4B/hiwgAAKOXj
	przbHkSnL54YR2sYhu+RhM0/8g==
X-Google-Smtp-Source: AA0mqf5EueLG5umo38k+Oy9FmPwR0t58Ma+OGjVEDqGQWiGk3snpn+pIfIke8R+7tljJ8H3spMsNEg==
X-Received: by 2002:a17:902:b20f:b0:188:fd02:5462 with SMTP id t15-20020a170902b20f00b00188fd025462mr57588715plr.36.1670050009954;
        Fri, 02 Dec 2022 22:46:49 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id t17-20020aa79471000000b00575c8242849sm6102091pfq.69.2022.12.02.22.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 22:46:49 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v15 1/9] RISC-V: Clear SIP bit only when using SBI IPI operations
Date: Sat,  3 Dec 2022 12:16:21 +0530
Message-Id: <20221203064629.1601299-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221203064629.1601299-1-apatel@ventanamicro.com>
References: <20221203064629.1601299-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The software interrupt pending (i.e. [M|S]SIP) bit is writeable for
S-mode but read-only for M-mode so we clear this bit only when using
SBI IPI operations.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/sbi.c | 8 +++++++-
 arch/riscv/kernel/smp.c | 2 --
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 5c87db8fdff2..ac99a70ead6a 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -646,8 +646,14 @@ static void sbi_send_cpumask_ipi(const struct cpumask *target)
 	sbi_send_ipi(target);
 }
 
+static void sbi_ipi_clear(void)
+{
+	csr_clear(CSR_IP, IE_SIE);
+}
+
 static const struct riscv_ipi_ops sbi_ipi_ops = {
-	.ipi_inject = sbi_send_cpumask_ipi
+	.ipi_inject = sbi_send_cpumask_ipi,
+	.ipi_clear = sbi_ipi_clear
 };
 
 void __init sbi_init(void)
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 760a64518c58..c56d67f53ea9 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -83,8 +83,6 @@ void riscv_clear_ipi(void)
 {
 	if (ipi_ops && ipi_ops->ipi_clear)
 		ipi_ops->ipi_clear();
-
-	csr_clear(CSR_IP, IE_SIE);
 }
 EXPORT_SYMBOL_GPL(riscv_clear_ipi);
 
-- 
2.34.1

