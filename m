Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B7E331A4C
	for <asahi@lists.linux.dev>; Wed, 25 Mar 2026 18:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774463909; cv=pass; b=or6nlIkuLtKzKymF2FnBL80bwT966DnQovE9ag46dbUgrfMiLVN+Wgh/xmx/H1hsxlsmxvRliSZqEBH8fcokneI19nSg6K17L0vcneEIJVxRa0yMl+BcyuDAhhApJaAf90ft24Y68q5oSawoJ0zD83E1rDrW/eUf9D4/IPLhP/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774463909; c=relaxed/simple;
	bh=u+xNc68n/VuAGKFDfj3CvMIA5VRpf2T78MAxIOjNdhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QuMA/r3a6RlaGC0yfwCWWv3v5Gh20mHOz0R0/8fJCuYU8Icftkm0cbpzs0YsNODcSB07CSt98I+tUjkX3hC6NaEwjzTlShPvkVGLuAsa5eQLGjB/H+tdPqxPDxuO5O4R0V8eQgb/6jtbqT3tnJOIkXYn181dbMpKhT1+zFeBSrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MT2BHhDr; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MT2BHhDr"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-89a1347051aso1494466d6.2
        for <asahi@lists.linux.dev>; Wed, 25 Mar 2026 11:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774463907; cv=none;
        d=google.com; s=arc-20240605;
        b=d4888c10gibmqG5vAcjtxrHXBpXAvq3W/0Wd2lNgu2E4tgNAL8CIszHLA1kgJfOLSv
         sgRaO3qdUw7BXFc8CG/qzMVGzLHrm2w72nsecziiCCWTOADpQ5ednbCoUKMcfXp+jKa+
         5hWPv+gBK+G2XHL0+U1p5WogXmQtN8WyDAycwT1ll1Uhe91wShqLr6w9Vjs1k5Urrrzd
         7/bbmvjitiYjSGtOnUOVSoYg010ES5y1MQO58CYfcifA5Kq/PeFduIWmEzVj+jipdu4R
         PDnqMEHCGZJTJsjWjns1fNwFlC9e17YRMPFnB/Cy3a0Z4H1kD76ftxX9PozpjgsaYwV/
         C3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+GA4/9xtXkKrksVBbHSHcgOuftKgItmsz7MH3HGa4+8=;
        fh=19mI0r1UKyc8U8cje0eWtgNcz9pqLK2RkmfQmoSq81w=;
        b=OkZHh8s4t3TzohfatrnPLHGLk2p0v3NCJ7fl+0ly/eiYZw0ogj1DzD+HlWe0aaqf8g
         11YoaQWuMsDk+fyA8KWCR4rj4kEjMKFzAu4z1NmumaUNn6pKM9wsokJm55Esazw758Np
         VtDIs+zKnOd0V44rv6A4fwh3dlSTwH2w/u6k/ambYq2NIlsEhxvSEZTNMNVQ3LHNod4c
         3GBeZwX1HATfuzOB4e4UzHVZxDX+UXqDVqZxQK1nr/Dp+gb6s3k/bXkEdqHNYAZGbWpH
         tQbKpWkxSBYIxW5yw3WjHbnL6Jl9gnXONPj3GGxdn2nhzxZOjS+Q0gZeBhuIM8On619I
         HDWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774463907; x=1775068707; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+GA4/9xtXkKrksVBbHSHcgOuftKgItmsz7MH3HGa4+8=;
        b=MT2BHhDrcE+k5bRrlYkumLFZ7rcJ4tYSEYTeAOTDo9ifidlRRn2NbcFqWChwEvFvax
         LzaaudFfW5ZzNczsHA2Rz7uQtgM+O9gkKamhhaW+ch9++c51Zjg2kCqZb5LdIs9NLppx
         qVzm6bypeKy8zJ5/RPq8UlnvkkRFtODB3LODd+OnbjWQenhbAbzVOE2/rgs45DjdpFvk
         PeKHZGvYaE3F7gqMIputMWuf2Kjb4n/MsJAtKT3Gz7ifDX13+uzUlqUhCZyoTkN5BXF2
         7wccmaz3aXQNWGKGOjK6GhG5LyRm/0bJ3edLr+04SezGts8mWD242RhBOwhroj7Vp1IP
         6wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774463907; x=1775068707;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GA4/9xtXkKrksVBbHSHcgOuftKgItmsz7MH3HGa4+8=;
        b=OQk29oWzShXVdBmc0nLLNiu6Eh6k4CT78kv87KVgszV99i5mvB+8PJKSpthviZRleG
         oIroJ38Wr1zosVcXXss2P1+aO3Gd6HVD2SBq27XuXKi0mpOsK0BPntv8707LGEjIEt/s
         SMKGdPd8Jpm+diX2lmQtWC2uDx3muNwQ7HZSVNbUNlM6QzPYeJfUvF857owvMuRpi72z
         0dkWeJ2748yt+Fa2z3YkxrgyPMXwyOJ+peTT/DJ00NyT6NwcSze5lw/Secz8TjxLvYhF
         TGBx/VzQHZYNlcKVQteb+WqruFOtjswvQxAFFpabycpQdZsffOTmWBm9S/ZsQwUVu5ss
         BuOw==
X-Forwarded-Encrypted: i=1; AJvYcCVyI18j1VnLFYpHXHrYHvBAwVTsvZhAuzwXhORMs6HO2KKNpWPtaW5LvVEHZwFEKBNzQZqXQA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd+eZGY3Ic+obUVCEmUY2Ua/R3ioAPJhuApqSurr+qLH8UUwDi
	ynupgtcxgW0nov78e8miAMW05HBjh+WaXRHXG0owwgDnsvAslIbSKdYnjRdu0mtPi1f4X3H73C8
	CoPuVqhxZX4u30ur4DqS14APNKwPaLF8=
X-Gm-Gg: ATEYQzxJufaPQPTW0KspoQKTwbcTthgZxJwzqjdJZH0p2+0KXXl2YwM0J3InyPq7XMA
	HgL6QouPawlLEgnKn8agLOkTV2rWjT95Wqfvn9rVy59U4J+vn+mwgJA5nBGGQq1sSrXmTjp3GQB
	9TmadeZ9o+P0cKaMrpn8MW3L0hWVCdM7mo/XIDZBoElMdHjamJlruf7uuoVf67ifxzbkJeftQSy
	we7Mpsoumpbg920P2qzQ1YZlxKlUYqLhI8GvJLLobEIqRxqDQQINb9X5kuASKFSkHLUrlmoihmS
	JWKoFGwWNhPvw7z+HgazgJ11xVk6Lp0UzlN7zmX6
X-Received: by 2002:a05:6214:f07:b0:89c:d7f5:b9c2 with SMTP id
 6a1803df08f44-89cd7f5bc2fmr605676d6.31.1774463906525; Wed, 25 Mar 2026
 11:38:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
 <CGME20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p6>
 <945a3e98-ee75-453c-ae80-f3c9e3e57e58@gmail.com> <20260325063333epcms2p60954532c1b65a1665bad6dcdcfd7d62c@epcms2p6>
In-Reply-To: <20260325063333epcms2p60954532c1b65a1665bad6dcdcfd7d62c@epcms2p6>
From: Justin Tee <justintee8345@gmail.com>
Date: Wed, 25 Mar 2026 11:37:44 -0700
X-Gm-Features: AQROBzAKxPhpmC6ZawP0BlTH0WgQy62IbCN9C0mYIPU9DegmKkKMWApqZpayBrI
Message-ID: <CABPRKS8-x6Tfr90inpz1fR0=8a5HD=mkujtfLJ1h9ikEUjTvxg@mail.gmail.com>
Subject: Re: [PATCH v3] nvme: Add nvme_setup_cmd to host_path_error
To: hmi.jeon@samsung.com
Cc: "kbusch@kernel.org" <kbusch@kernel.org>, "axboe@kernel.dk" <axboe@kernel.dk>, 
	"sven@kernel.org" <sven@kernel.org>, "j@jannau.net" <j@jannau.net>, "neal@gompa.dev" <neal@gompa.dev>, 
	"hch@lst.de" <hch@lst.de>, "sagi@grimberg.me" <sagi@grimberg.me>, 
	"justin.tee@broadcom.com" <justin.tee@broadcom.com>, 
	"nareshgottumukkala83@gmail.com" <nareshgottumukkala83@gmail.com>, 
	"paul.ely@broadcom.com" <paul.ely@broadcom.com>, James Smart <james.smart@broadcom.com>, 
	"kch@nvidia.com" <kch@nvidia.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, 
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Minsik,

> - After
> nvme_setup_cmd: \
> nvme0: qid=0, cmdid=32777, nsid=0, flags=0x0, meta=0x0, \
> cmd=(nvme_admin_identify cns=1, ctrlid=0)
> nvme_complete_rq: \
> nvme0: qid=0, cmdid=32777, res=0x0, retries=0, flags=0x2, status=0x370

> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index 766e9cc4ffca..378d28b2c971 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -512,6 +512,7 @@ EXPORT_SYMBOL_GPL(nvme_complete_batch_req);
> blk_status_t nvme_host_path_error(struct request *req)
> {
>         nvme_req(req)->status = NVME_SC_HOST_PATH_ERROR;
> +       nvme_setup_cmd(req->q->queuedata, req);
>         blk_mq_set_request_complete(req);
>         nvme_complete_rq(req);
>         return BLK_STS_OK;

Since trace_nvme_complete_rq is printing only cmdid to help identify
the command, why not define a new TRACE_EVENT(nvme_host_path_error,
...) in trace.h instead?

So, perhaps something like this?

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 5037444687bd..a2e253dbb744 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -511,7 +511,11 @@ EXPORT_SYMBOL_GPL(nvme_complete_batch_req);
  */
 blk_status_t nvme_host_path_error(struct request *req)
 {
+       struct nvme_command *cmd = nvme_req(req)->cmd;
+
        nvme_req(req)->status = NVME_SC_HOST_PATH_ERROR;
+       cmd->common.command_id = nvme_cid(req);
+       trace_nvme_host_path_error(req, cmd);
        blk_mq_set_request_complete(req);
        nvme_complete_rq(req);
        return BLK_STS_OK;

Regards,
Justin
