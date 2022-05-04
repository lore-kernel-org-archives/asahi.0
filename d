Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115132583
	for <asahi@lists.linux.dev>; Wed,  4 May 2022 15:41:07 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id n18so1747664plg.5
        for <asahi@lists.linux.dev>; Wed, 04 May 2022 08:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=OYaJ+nY6MJoTuRbNI0oi9+YWr+7Af4fO9Mf61xdHHuM=;
        b=JT+MsTqYAEPdfFEL0p7qrpZLTJkoJ/1EZ/TkoDw1m4yezUIPwW5jKSqSPXk/BdQlum
         /rilPjgh8R7J6CrxjWxD/bNCvBy0ex8qRqornJzz+bY18xvy4zMKJzxICXzMsJTfeqkD
         7m2JAZHxKqksArE4yx35mm0MN9VYu/oeH3nEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=OYaJ+nY6MJoTuRbNI0oi9+YWr+7Af4fO9Mf61xdHHuM=;
        b=ivptoquOoJuJdxWRFQH8mFmYzXIMCZH7NNJl33hTsuEWegG7N2rW42Te9wtknUb4VG
         j5dKuSR10RhPP6/+5ET/OMBqfHiFcSeUXwVYfzPeZnxyHydht/8gmXXuAu9g5i4GLMkS
         pPjRVb+KGvyLXZeSdPqhElcsJ1W4prqdmr9V9+V2+6d/bc+7lO0mAfHBeTlhQR0jjmlc
         ac8ejgjt/WhG5jD/B9tY+BBOpoxKm2pmO4cwUdZsLU567BkeYhawhoGrcPwOjBXtb0WD
         IrUxFnWGHu5OpQRxl0eX+LvGMR4LfUpRpx0559Tin64UDkqZLspY/aKPpprs5Nzz8EQa
         r2Sw==
X-Gm-Message-State: AOAM530HWE0IaPgeSNrRwnihEnceR8To24xKzyvKj1SbLlgZGaekhGhI
	PxM4zuIlZwknhutvUElXlFyYQTclZnWj+0Yp
X-Google-Smtp-Source: ABdhPJz0F2duarbFNBM4kTTuu5bS3u42Sul/eZ+4D77krGQFJGKwzsFACkGEBOdMh+hnKQtEBFHaGA==
X-Received: by 2002:a17:90b:2243:b0:1dc:3f08:8316 with SMTP id hk3-20020a17090b224300b001dc3f088316mr83266pjb.194.1651678867238;
        Wed, 04 May 2022 08:41:07 -0700 (PDT)
Received: from nitro.local (wsip-70-166-189-147.ph.ph.cox.net. [70.166.189.147])
        by smtp.gmail.com with ESMTPSA id k16-20020aa792d0000000b0050dc762815esm8363878pfa.56.2022.05.04.08.41.06
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 08:41:06 -0700 (PDT)
Date: Wed, 4 May 2022 11:41:05 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: asahi@lists.linux.dev
Subject: Follow-up test to retrigger replication
Message-ID: <20220504154105.c6emmbzefsa5sbvr@nitro.local>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Please ignore, this is an email to try to retrigger replication to lore.

-K
