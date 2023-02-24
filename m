Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1F233D6
	for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 14:37:11 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id u14so13011058ple.7
        for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 06:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtHGA3HFyOs3Fz5IJ5DexsxarDl9tkHRWlmic7uJ/C4=;
        b=Dx2Grd9BGKbRDkGFAUPYQ8vTzH8QWnDRsrCraVsYxfUEWdevRLBi1R7C5EZoW7zxZ+
         pLz5iJ+OsoHHhgDycBidBpMHnZMuQ8p67MXtb5rU859qW8JxsTxD83dfz2l2zp1PfH7D
         3IpSsiccmyOeXVqk5vpQAbjayRtfEjZ0EtE4NMKFqERzsKFNfDaKZ3V0sS8jVgAMJqXl
         Iqt6vwYqQCLDLJ+/5+bB5BRj73Mi2AjmkamOWkf3SswgDF+YjKKnemJbrIVpmwv8HR+q
         jNdjAHK4HrQm720hJSG9zDcdielgSq66xcEZpQmUoOIX3NNzITIsdDyEDBef5BH5A2Fj
         IYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtHGA3HFyOs3Fz5IJ5DexsxarDl9tkHRWlmic7uJ/C4=;
        b=4RZAg5LdWeHFdTLEd17F4G0wo65nd64QixahSK+WKWWYKvVC07H/0jH7kwmib7XkOH
         /JZbF4OOEMqt0rtG/UuS3TmUNY0LGF6HW3Y8zbNbPx2OQTx7qefQbyuh0VhNTcsPOReI
         q+OCccO3LxzX1XIfWRVtBI+OV3cweFWwn9qsLN195zRQpO+BlHWoGLE3IhailV6i/x1z
         O6P7uKdqAMf5FAUtuTak7efanPyarrq+McOfZlu1AuadTHqkFJUy1AwxEasR5awuDoGE
         bVk/QaJDG+3sXXNEo1YjOxaNvLuGis9JEW6lvJtYDpyNYBS7TNbsYboTdgLmIQ8x6MUo
         I+tg==
X-Gm-Message-State: AO0yUKX1M4wtGixKZ9KEvO4oMzDyELqILjmRL30tnjf52mc2hP+s1ijQ
	xmE6diWDAjoZ+R8MSG5Eyo0=
X-Google-Smtp-Source: AK7set/ujXfZPMz7EOm7ZILbEIxe4nKgXMWAwvoatB7ZrSFIzQwgPsGrmI4DoRt0El6v7VLELq5Q8w==
X-Received: by 2002:a17:902:f605:b0:19c:dd2e:d4f5 with SMTP id n5-20020a170902f60500b0019cdd2ed4f5mr991892plg.36.1677249431225;
        Fri, 24 Feb 2023 06:37:11 -0800 (PST)
Received: from tx3000mach.io (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id k4-20020a170902694400b001963a178dfcsm4047493plt.244.2023.02.24.06.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 06:37:10 -0800 (PST)
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
To: lina@asahilina.net
Cc: alex.gaynor@gmail.com,
	asahi@lists.linux.dev,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	wedsonaf@gmail.com
Subject: Re: [PATCH 2/2] rust: sync: arc: Add UniqueArc<MaybeUninit<T>::assume_init()
Date: Fri, 24 Feb 2023 11:37:01 -0300
Message-Id: <20230224143701.755103-1-yakoyoku@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224-rust-arc-v1-2-568eea613a41@asahilina.net>
References: <20230224-rust-arc-v1-2-568eea613a41@asahilina.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 04:59:34PM +0900, Asahi Lina wrote:=0D
> We can already create `UniqueArc<MaybeUninit<T>>` instances with=0D
> `UniqueArc::try_new_uninit()` and write to them with `write()`. Add=0D
> the missing unsafe `assume_init()` function to promote it to=0D
> `UniqueArc<T>`, so users can do piece-wise initialization of the=0D
> contents instead of doing it all at once as long as they keep the=0D
> invariants (the same requirements as `MaybeUninit::assume_init()`).=0D
> =0D
> This mirrors the std `Arc::assume_init()` function. In the kernel,=0D
> since we have `UniqueArc`, arguably this only belongs there since most=0D
> use cases will initialize it immediately after creating it, before=0D
> demoting it to `Arc` to share it.=0D
=0D
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>=0D
