Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D118879C5
	for <asahi@lists.linux.dev>; Tue,  3 Jan 2023 14:12:39 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id v23so32989271pju.3
        for <asahi@lists.linux.dev>; Tue, 03 Jan 2023 06:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7ob+2vX2/dVNm5GFakcAOJyyRuKnpkny5ZMoNumsbg=;
        b=SC2efmYBg1+mzWG7pzPU4iMr+PFRDzvoSWpPlMH6YKZt+hR0iPxqcmZWSNcJZCwK+V
         wGRjiEBBWXFHOjS8klcs14FF4xiO7xLK0pCoqBYolvIG1iykE4ltt2whCD6AO6Aso8Kn
         MzrWZDqM22mMPuAXNi7yVnIy/CsR5G1o0diamtaLsY1wKt4FJ+iavxU0hkGBvYYRtGxP
         +LGdmSucXk4gNVRAfh678TYbLDK0rOVPEpKdlx1zTtJ/AqLzEk8LgJ9q+0h9Lg16rfzH
         aHkp/bUkC7wYGRYNge/xd9Kd/a/t0IGbIYnEGcKqq8VqYT6t2dXt6RNKDrkctboafOl8
         TwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7ob+2vX2/dVNm5GFakcAOJyyRuKnpkny5ZMoNumsbg=;
        b=uVt5eYVoqOKY45UxwOEuf5ZLW9x/v5IWR1+y5JEcyD4Az1pL9k3C5yVZU9yjHA3ZzW
         Wue3Ggc320LJ9nGaJwwNLrt9F353Jw5Y+XOF3w7jp7meV+UyGQKy2Ig4UuRkKl3xRs3z
         zV82is9FpUeGkPlKf4zdzxorkhy712KfyzNjG3Uy9GlaAMn88Ijem6Sc0uTU31xllP+H
         V0swy00NqZ3QJa2pwfNm01/KxgSa0aeuaNURYGmtanowqQXpKLEg0+ijzpfPbnHW8f5+
         3JvD7oJlz6tFKf3huvwkHhiZj2MfxxIS75UG2dgqNW1aHqvSc2vIN6uyPbMnHk++K2Ba
         bXJg==
X-Gm-Message-State: AFqh2krhBv7T3Pbo3yWOtGX7EKBEvD2qP04ynZNMhxAFxm1gEjYfNqM9
	Hdfg5ylMkO5AExI1Idahds6TZA==
X-Google-Smtp-Source: AMrXdXsdaNFT9PfPhIcXX2+sh5QFHWfKnommCCIjPlGRE8sR3Zqyk6aDdAW9OIFDQIqGWaWuBKBr1g==
X-Received: by 2002:a17:903:2411:b0:192:d9dd:167d with SMTP id e17-20020a170903241100b00192d9dd167dmr3077913plo.43.1672755159141;
        Tue, 03 Jan 2023 06:12:39 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id x16-20020a1709027c1000b00192b0a07891sm8598286pll.101.2023.01.03.06.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:12:38 -0800 (PST)
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
Subject: [PATCH v16 1/9] RISC-V: Clear SIP bit only when using SBI IPI operations
Date: Tue,  3 Jan 2023 19:42:13 +0530
Message-Id: <20230103141221.772261-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103141221.772261-1-apatel@ventanamicro.com>
References: <20230103141221.772261-1-apatel@ventanamicro.com>
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
index 8c3b59f1f9b8..8a12768c09ee 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -112,8 +112,6 @@ void riscv_clear_ipi(void)
 {
 	if (ipi_ops && ipi_ops->ipi_clear)
 		ipi_ops->ipi_clear();
-
-	csr_clear(CSR_IP, IE_SIE);
 }
 EXPORT_SYMBOL_GPL(riscv_clear_ipi);
 
-- 
2.34.1

