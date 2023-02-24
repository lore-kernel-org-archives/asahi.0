Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016DD3D8C
	for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 11:04:18 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id o12so53750633edb.9
        for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 03:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gdwuEywNYdOYbVwrQQrjrsPur3vIHOPWD3d4XxXbKX0=;
        b=MSxzV+R1ku+iZcmavQzQwnWy2bxOkcWE8XUdsyKIODORtXEcfVCF4fOVSMRZkPxz4v
         0bz3EZvLCc1ijoG7YDtTTNdpxoQlB1L4D800QT5A5oZ+D0OLsVCZ1ub27n/XqFmMovnq
         SZprioKSlochMIlRzGmjukLD8k+x2Dlq4JOjVcBFmMy8aeya6wwmj724nxotIaGxWySO
         dsAax1prAXEmqO+a01UTHbuPs6m0sy/izKh2WGtxg4JcYdA6rF+MO7Egzn+ndCLlsXtH
         S/3K6KhM29cuMF62wxyeWl/+ZyhWKhFlaJPSNSun8OjgUNqr+JmZeBI6rxtgfbIgstXP
         nf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gdwuEywNYdOYbVwrQQrjrsPur3vIHOPWD3d4XxXbKX0=;
        b=Kb4brFoxUPtMDMqgiVvGCS+jCMK5XeSXm/dmkQyS8NtbVwxIl29kAjTTdYqlHHBQ/B
         UCO+4xy2DxsGylE16pKXQW75AWl7sasIJZVKc6yceJVigrYaxzKCcMNxKyIf1yCQsjl+
         AfKQdh4mnU6+qTQOV9e+O5N/P2vuvTxz8rYfrgJeNyv1fTSQykkcxvNhEKcJAEfTXCKa
         FzGrg1iAjP61zNZXKSuivmYwLVwIb5IPuyl7KKonnXA5TDvinl4mQCZhOhJjbCyuMDTA
         pJsUmuZHtzgNGlVQPKS9agYTcFoDdPWjM3eqOrXeNwilO7N+mMn4dqF3DWpjC34fAlyd
         INXA==
X-Gm-Message-State: AO0yUKW+QOTXFbzO9s1iScPfz1iKrld4x687yWuG4KRnIMDGaDV2QZCg
	3EtAoTFv3ZqxA8N0y/LichiaZR8thlsq/B5x4pEH60NLSvYKNg==
X-Google-Smtp-Source: AK7set9Ir/cY7edp/BficUGznr8dJBEy/FQHiI0VNP5F0lqBK32AocTLjQxCKgd+qQmB67y0eof9R8/Ey6CMcCo7af4=
X-Received: by 2002:a17:906:2a93:b0:8e8:9fb7:5aa9 with SMTP id
 l19-20020a1709062a9300b008e89fb75aa9mr3890235eje.9.1677236657213; Fri, 24 Feb
 2023 03:04:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230223-z2-for-ml-v1-0-028f2b85dc15@gmail.com>
 <20230223-z2-for-ml-v1-1-028f2b85dc15@gmail.com> <87r0ufs574.fsf@bloch.sibelius.xs4all.nl>
In-Reply-To: <87r0ufs574.fsf@bloch.sibelius.xs4all.nl>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Fri, 24 Feb 2023 12:04:05 +0100
Message-ID: <CAMT+MTQOUd0aSDJ3DPBMfkVwaic=nbRPtfGgu2nduSdCdydcgg@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] dt-bindings: input: touchscreen: Add Z2
 controller bindings.
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Cc: marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io, 
	dmitry.torokhov@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, asahi@lists.linux.dev, rydberg@bitmath.org, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Feb 2023 at 11:55, Mark Kettenis <mark.kettenis@xs4all.nl> wrote:

> What is the motivation for including the firmware name in the device
> tree rather than constructing it in the driver like what is done for
> the broadcom wireless?
There is no way to identify the device subtype before the firmware is
uploaded, and so i need some way of figuring out which firmware to use.
