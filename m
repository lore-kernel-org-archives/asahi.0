Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94E3219A78
	for <asahi@lists.linux.dev>; Fri, 24 Jan 2025 08:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737709114; cv=none; b=Bmjd0si8dTRf/TdlGAcIQNQ06XGFcUQ8LGLiT4dx2FbuNKI8AvrItmI0Sl/YxrYmQrRaWpwI+BdHia9eaV64w8CKKoCX9jlNFAW9qxa2GWNgGXFft52Wfyo1lr0/ANdbMC3QR8KkMfwkMO7MXJFqBs0tjBlFrGH5uACGH1D/KkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737709114; c=relaxed/simple;
	bh=fNI4UdDtZI4AVcTD8TnjHEnynSXd6Y+lcwnBOlUgb0k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H4c82N00ojWQYSFpD3YJatCZenR3vlhkvjXBmgRi0XyfvIRGsX+QLmf0kNhNbFZDxm0miEitfnjkkhgqFZVAgScJso1r8XBkFVlTyJEjpT0NnjubMg1zioyucV8Q9CCUGol70pH3Wo2YRLHwX3Vtk6sx9U4Uqb+rwLmH9SmlpD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fl8KJaLS; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fl8KJaLS"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2164b662090so35949295ad.1
        for <asahi@lists.linux.dev>; Fri, 24 Jan 2025 00:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737709110; x=1738313910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a4AqRX4jgpQUQupuoQFqpmYTbRVzBhfX6O9GAy7aKKQ=;
        b=fl8KJaLSkukCZWh8Lbwpcw9AhU+hg5HeRWFD+Oq+HKwFRjb03fkdJ75TJP5VBqyy0V
         7f4uhxbmFmajSJiyaryDLlfb4yIWR08WE4zAGD/q3VhDz5Z1gVrw8LXPnC4nSeudtcc9
         j9LYSXSxwBJ1g3fyF+/KS7aUfoDF0b5iBPJapnfRXBrJ+VbyehVIInH4Ke/c/s27DTgl
         yaR9/EfjWu9AagB40/NlpkqsZh1tHbHRqylEdzx7Y5N36EAwYakj8lxwyiojdMhImTWt
         01UF1weCSyzKRXJyPNoIzPk9vU5h/IbNcfTl1FQOUHJdIiqBONuzQZTsxwM99SzwfVto
         MrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737709110; x=1738313910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4AqRX4jgpQUQupuoQFqpmYTbRVzBhfX6O9GAy7aKKQ=;
        b=DUhw3ZsbNkWSUmI0yHk/HFxZQ3/oa2fj+JnOjI9jHoVrm/3KHP3zkoHVXGZEOaKb5N
         IdnigFx11fAo/fYlsS6TbeK/BTymt0wlss0VF9GQa2HK4jyWxHNI7U/0VPC0oGSOq0Ui
         g/9Z1LBQ7p3W6AMtd1Lo4De0cFJEGDuCY47h2pyesBJAfxjaS+6rTyKb/3V7VouTtUEp
         +v9UgUsqzJOIauQy9QM+68hC6ZthfCIZP8MRLZ8bz5QmZqJI5tsgcGi+iiUI9msxBBYA
         qQ/lSxKqq7NCt3SU5/TpaHCM+tg0IBGyoKjfmFnpAV6yQpMHPJvmaPlIxApslFbo6Ae1
         amTg==
X-Forwarded-Encrypted: i=1; AJvYcCWTXESxkcS9xKopVH0gCYeYs6i6EsesE07FMr4/1wqMriUrQj0Dwvlz0OOIDEqAOugABNTVAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHrPZU7grKbgbSYbHae/m4/107j0uqRlrqhqRoIEgcJ0bHpFwE
	gVuebfsErbC2QhutVQJgFrCaFYRQB+vJsg6B8KXbbX+d0qIxeWjYhe40vT0KnSI=
X-Gm-Gg: ASbGncv/Q9iBsDzyrg3+tGcwVGj0/MVj3qx+LVLMYyxMExv+/K9tmoV6R2CVW+E7X8O
	fsfybRUJkUBeN3IEscQPTNiRjAz++63VJgP/ssmE34aog/t5f9CFuxrDQ6Wnm3DnWFNaalwHGoM
	g9Xk8wsX/VIefRoCbjce63L+HxiJjn3rL0Wk1gVhfiy5bpv8XnLbjy/TRbA4pPRURjet8ubcuL4
	Vx0AClH6VZR+ib1UbCK9kz3j0XSJphNcI6zO3xKGIMxtphOlMByszVR2xPbrFvkqpHgy4uWyha3
	cpbDlfg=
X-Google-Smtp-Source: AGHT+IGaLv3P86dnfhfsz8clY+KvPxRH7m/1Pd0NzNkAaLxjGYIDOwn76y4qMRrSSuP3v13w1OIdqA==
X-Received: by 2002:a17:903:320e:b0:217:9172:2ce1 with SMTP id d9443c01a7336-21c35544407mr480084755ad.22.1737709110054;
        Fri, 24 Jan 2025 00:58:30 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9e1b2sm11621015ad.17.2025.01.24.00.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 00:58:29 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Hector Martin <marcan@marcan.st>,
	Huacai Chen <chenhuacai@kernel.org>,
	Huang Rui <ray.huang@amd.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	arm-scmi@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev
Subject: [PATCH 00/15] cpufreq: simplify boost handling
Date: Fri, 24 Jan 2025 14:28:04 +0530
Message-Id: <cover.1737707712.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

The boost feature can be controlled at two levels currently, driver
level (applies to all policies) and per-policy.

Currently most of the drivers enables driver level boost support from the
per-policy ->init() callback, which isn't really efficient as that gets called
for each policy and then there is online/offline path too where this gets done
unnecessarily.

Also it is possible to have a scenario where not all cpufreq policies support
boost frequencies. And letting sysfs (or other parts of the kernel) enable boost
feature for that policy isn't correct.

Simplify and cleanup handling of boost to solve these issues.

Pushed here:

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/boost

Rebased over few dependencies from PM tree, will push to the arm-cpufreq tree
after merge window is closed.

Viresh Kumar (15):
  cpufreq: staticize cpufreq_boost_trigger_state()
  cpufreq: Export cpufreq_boost_set_sw()
  cpufreq: Introduce policy->boost_supported flag
  cpufreq: acpi: Set policy->boost_supported
  cpufreq: amd: Set policy->boost_supported
  cpufreq: cppc: Set policy->boost_supported
  cpufreq: Restrict enabling boost on policies with no boost frequencies
  cpufreq: apple: Set .set_boost directly
  cpufreq: loongson: Set .set_boost directly
  cpufreq: powernv: Set .set_boost directly
  cpufreq: scmi: Set .set_boost directly
  cpufreq: dt: Set .set_boost directly
  cpufreq: qcom: Set .set_boost directly
  cpufreq: staticize policy_has_boost_freq()
  cpufreq: Remove cpufreq_enable_boost_support()

 drivers/cpufreq/acpi-cpufreq.c      |  3 +++
 drivers/cpufreq/amd-pstate.c        |  4 ++--
 drivers/cpufreq/apple-soc-cpufreq.c | 10 +---------
 drivers/cpufreq/cppc_cpufreq.c      |  9 +--------
 drivers/cpufreq/cpufreq-dt.c        | 14 +-------------
 drivers/cpufreq/cpufreq.c           | 30 ++++++++++++-----------------
 drivers/cpufreq/freq_table.c        |  7 +++++--
 drivers/cpufreq/loongson3_cpufreq.c | 10 +---------
 drivers/cpufreq/powernv-cpufreq.c   |  5 +----
 drivers/cpufreq/qcom-cpufreq-hw.c   |  7 +------
 drivers/cpufreq/scmi-cpufreq.c      | 11 +----------
 include/linux/cpufreq.h             | 20 ++++++-------------
 12 files changed, 35 insertions(+), 95 deletions(-)

-- 
2.31.1.272.g89b43f80a514

