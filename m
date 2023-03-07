Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22794BA36
	for <asahi@lists.linux.dev>; Tue,  7 Mar 2023 17:32:51 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id d10so8047608pgt.12
        for <asahi@lists.linux.dev>; Tue, 07 Mar 2023 09:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1678210370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBw3TUvFHk4RKUwdqt9BFDNXuR7r1OX9/mPGk36mvP4=;
        b=no8qYmaEO+2AGv/Ic0WpAXhLuyjcpmP+pddKfSSqCaCJt71sjedirQTG5rKbhWo0VO
         LbeOdWHltmNGIhPh4VVLPe8P5FMb29kcKyVbQU5NovEd9UTjfP/gi9mg8iWkPgw5xuNZ
         a/bqLpllTxdQABnMfcHSDA7BAhWlFaFFc1NVdJDeT6F77CHXS4Xa4dZUwk2lJ/Rd6zj8
         p/TYLthWsJW2lXPKQa+KoHE5/C7R5grh6KH+lvllRdXaKOTVwfZDBHCDJoLsWerQb4IP
         KL8KUpFZ+eHG0Hnr4LbUCzwyraOdF7O4veUu1+YmM3Hp41EBZlNT/TapTa8XVGvOr1fF
         TLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678210370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBw3TUvFHk4RKUwdqt9BFDNXuR7r1OX9/mPGk36mvP4=;
        b=dbEmI0XtPCBEICZVvubbL/yXI0nQG3w8h0lzUxmpHEVkjRaL73eIGlGk3oOmuZEzV6
         Q7jmlZfhsOR3W571WaVUWnwCcAPa6dbjW1JX9t6QeeDfDf1UYnxm/iQazl4Rotu6fj7F
         /0FLl7wiNFkygWlqxovxPPfrKdsuf3JDxUw7YuZSSevsNOQmZRJoC5gPF8fAmaN4fuWG
         7GII6SlGK71WmB+2JvWYMprtW16IHEhoZG+10ddiK1nG71FhdOZWS5tuiAijyPovDCq+
         SZtCqcKkQDbh7Tzh97B2PX9lAMHW07pIAJnl2Asn7rrNPZ7xRi/13cRQM6pw/UQ6aq/g
         wVlw==
X-Gm-Message-State: AO0yUKVEpsrJMabV0s+fKDPnBMzB712jRhm6z/rpMNDI+s7sGqrKwIKu
	o6BEfUh84pfLm3vlxsfVD+DrtQ==
X-Google-Smtp-Source: AK7set9VDW+R8Pvm7Nwl6Z27bo4m6udIt0gmbM7cBQHWzoLcG66d1Q09gvMWXcvjsWgwx+3bYcCocg==
X-Received: by 2002:a62:1c07:0:b0:5a8:a467:f975 with SMTP id c7-20020a621c07000000b005a8a467f975mr13843121pfc.17.1678210370359;
        Tue, 07 Mar 2023 09:32:50 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id 1-20020a630301000000b004fb11a7f2d4sm7996185pgd.57.2023.03.07.09.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 09:32:49 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v17 1/7] RISC-V: Clear SIP bit only when using SBI IPI operations
Date: Tue,  7 Mar 2023 23:02:25 +0530
Message-Id: <20230307173231.2189275-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307173231.2189275-1-apatel@ventanamicro.com>
References: <20230307173231.2189275-1-apatel@ventanamicro.com>
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
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
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

