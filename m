Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800972;
	b=wnHFfgWMLaUuvKOQA8ikM+4HGugstjxT52yZjtCNCN1nQL6TxuZ+DwV24N3cOqTctGof
	 vduY1W4LTrrLSq8WOa833ealycTkBT72Pm7cTdAYy/c4JpDAddjekJu9eQLDOzjqlCblq
	 4Hv1Bapy6Uwq5+nqCFwsKk5qUMWx+6lYETPJs3lsfCm7ghTtgcJzHNJOns9+2Ke4ANyGa
	 vUEOB4clVRz6gUYxisqPxqBfbM8/yDmzwCdcAomFNRXIUpqcQOHZKY/w0e0vlEmzzrH7C
	 FopX2HNYGnRMJNyFs3cwCKIYFvxRsO9i5Z+j9Pb3C8xWI9RpzzvLs17UfY6mxRCzBlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800972;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a+tdEHV+yBIYdoACOY/uWrgbD09pWgu0ktfwLPb8y14=;
	b=yRhgrG2tEKAC23jAH+sq7jAW06xpPFpzUTkjU1DwBKvugtHxW2Vd0RO+sUGkAbZZZL+2
	 fDlKDtWZNpeg/KH7iYhNR4svyfXEBZEyzoW5y/E7yjPgyfPZ4a8tioyqq3x1W5twTqjue
	 pjzuMs/gIYSeE3CZ5x4YGOqKqI5cg4Kp4HO9cPgl4LI3mrQ5XhDAPEB8IgIqTbGrLKx+J
	 6OT9IBi5cq1XBDwhOBj1w2gcmO4FfPzUyk4SNc+U0p3jrVU7NySafhnqRelGKtYedLvtz
	 Zvzq/KaKGP07GZhK3EJgOl2+eMwAwplikPYiRq5WeLBTrSo0LzDSfw3d9dkb26RW31A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=mlf5Tp9a;
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B90606A329;
	Fri, 27 Nov 2026 17:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37B90606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=mlf5Tp9a
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795800969;
	bh=4Taa4Z5rGU4YzC9YImE2VSqet3BlgWoV2kbbysqDb4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mlf5Tp9az6EKwWYUTsUzDGwB35xqhdLLqkGzZZzVjCo3m5O9XlWIwu3PbzMYcbr/H
	 vNirmzq0gB3HEF7nXYDBOYsjB/UpVstKkNYINU2F9xH5zLCQkdFBiHo31LYxehYu/e
	 TMLdW4vtA6Ug/uZVtNjf+f0L2xgarF2SCaBgDqKpuSfP796t8oxr8KWublUpr+uwE2
	 TtbWgm/VAds6hD7KPR9w50ARu3Ms/sLEmvpZwcSRo69ooqT6VU1cpsXExNw6zwar3Q
	 grgAdHDJSLHX7HkyvJkiw3gfnH7lO10I6M6CPVyVeWQFy33hdFd7IpCpRt0Xa5UO0s
	 ai+52KnEXoZNw==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com,
	Soeren Coremans <sorencoremans@gmail.com>,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: [PATCH wireless-next v3 5/5] wifi: brcmfmac: pcie: support inband device wake and deep sleep
Date: Fri, 27 Nov 2026 18:35:49 +0100
Message-ID: <20261127173549.29335-6-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127173549.29335-1-dev@deq.rocks>
References: <20261127173549.29335-1-dev@deq.rocks>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BCM4364 and BCM4377 firmware report inband deep sleep in the PCIe
shared flags. The driver only advertises that it has no out-of-band
device wake. That leaves deep sleep disabled. The firmware stays awake
and its latency tolerance holds the CPU package out of PC10.

On these chips, advertise inband device wake when the firmware supports
it and the mailbox goes over the control ring. It comes on top of no
out-of-band device wake, as in Broadcom's DHD driver.

The host then follows the handshake of the firmware:
- The device asks for deep sleep while device wake is deasserted.
- The host acknowledges once it has nothing to send.
- Before it uses the rings again, it asserts device wake and waits for
  the exit note.
- After 200 ms without ring writes, it deasserts device wake.

Hooks around the ring lock cover every host to device ring writer. A
system suspend asserts device wake before D3_INFORM and keeps the
device out of deep sleep until the resume. Removing the device asserts
device wake first, so brcmf_detach() still reaches it.

Tested on a MacBookPro15,1 (BCM4364 B2), a MacBookPro16,1 (BCM4364 B3)
and a MacBookAir9,1 (BCM4377). At idle with Wi-Fi associated, the
firmware enters and leaves deep sleep, also after S3. Traffic works,
and the driver unloads with deep sleep active. The CPU package reaches
PC10 without ignoring the latency tolerance of the Wi-Fi port.

Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 .../broadcom/brcm80211/brcmfmac/commonring.c  |  14 +
 .../broadcom/brcm80211/brcmfmac/commonring.h  |   5 +
 .../broadcom/brcm80211/brcmfmac/pcie.c        | 295 +++++++++++++++++-
 3 files changed, 311 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/commonring.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/commonring.c
index e44236cb210..881505b992c 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/commonring.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/commonring.c
@@ -28,6 +28,16 @@ void brcmf_commonring_register_cb(struct brcmf_commonring *commonring,
 }
 
 
+/* Both run outside the ring lock and may sleep */
+void brcmf_commonring_register_pm_cb(struct brcmf_commonring *commonring,
+				     void (*cr_wake)(void *ctx),
+				     void (*cr_idle)(void *ctx))
+{
+	commonring->cr_wake = cr_wake;
+	commonring->cr_idle = cr_idle;
+}
+
+
 void brcmf_commonring_config(struct brcmf_commonring *commonring, u16 depth,
 			     u16 item_len, void *buf_addr)
 {
@@ -53,6 +63,8 @@ void brcmf_commonring_lock(struct brcmf_commonring *commonring)
 {
 	unsigned long flags;
 
+	if (commonring->cr_wake)
+		commonring->cr_wake(commonring->cr_ctx);
 	spin_lock_irqsave(&commonring->lock, flags);
 	commonring->flags = flags;
 }
@@ -62,6 +74,8 @@ void brcmf_commonring_unlock(struct brcmf_commonring *commonring)
 		__releases(&commonring->lock)
 {
 	spin_unlock_irqrestore(&commonring->lock, commonring->flags);
+	if (commonring->cr_idle)
+		commonring->cr_idle(commonring->cr_ctx);
 }
 
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/commonring.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/commonring.h
index 7fb11f4823e..a27be6d7b17 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/commonring.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/commonring.h
@@ -20,6 +20,8 @@ struct brcmf_commonring {
 	int (*cr_update_wptr)(void *ctx);
 	int (*cr_write_rptr)(void *ctx);
 	int (*cr_write_wptr)(void *ctx);
+	void (*cr_wake)(void *ctx);
+	void (*cr_idle)(void *ctx);
 
 	void *cr_ctx;
 
@@ -38,6 +40,9 @@ void brcmf_commonring_register_cb(struct brcmf_commonring *commonring,
 				  int (*cr_update_wptr)(void *ctx),
 				  int (*cr_write_rptr)(void *ctx),
 				  int (*cr_write_wptr)(void *ctx), void *ctx);
+void brcmf_commonring_register_pm_cb(struct brcmf_commonring *commonring,
+				     void (*cr_wake)(void *ctx),
+				     void (*cr_idle)(void *ctx));
 void brcmf_commonring_config(struct brcmf_commonring *commonring, u16 depth,
 			     u16 item_len, void *buf_addr);
 void brcmf_commonring_lock(struct brcmf_commonring *commonring);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index ea51ef6189d..8aa0fd57c1f 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -227,10 +227,12 @@ static const struct brcmf_firmware_mapping brcmf_pcie_fwnames[] = {
 #define BRCMF_PCIE_SHARED_DMA_2B_IDX		0x100000
 #define BRCMF_PCIE_SHARED_USE_MAILBOX		0x2000000
 #define BRCMF_PCIE_SHARED_HOSTRDY_DB1		0x10000000
+#define BRCMF_PCIE_SHARED_INBAND_DS		0x40000000
 #define BRCMF_PCIE_SHARED_DAR			0x80000000
 
 #define BRCMF_HOSTCAP_H2D_ENABLE_HOSTRDY	0x400
 #define BRCMF_HOSTCAP_DS_NO_OOB_DW		0x1000
+#define BRCMF_HOSTCAP_DS_INBAND_DW		0x2000
 #define BRCMF_HOSTCAP_H2D_DAR			0x10000
 
 #define BRCMF_PCIE_FLAGS_HTOD_SPLIT		0x4000
@@ -279,6 +281,11 @@ static const struct brcmf_firmware_mapping brcmf_pcie_fwnames[] = {
 #define BRCMF_H2D_HOST_DS_ACK			0x00000002
 #define BRCMF_H2D_HOST_D0_INFORM_IN_USE		0x00000008
 #define BRCMF_H2D_HOST_D0_INFORM		0x00000010
+#define BRCMF_H2D_HOST_DW_DEASSERT		0x00000020
+#define BRCMF_H2D_HOST_DW_ASSERT		0x00000040
+
+#define BRCMF_PCIE_DS_IDLE_MS			200
+#define BRCMF_PCIE_DS_EXIT_TIMEOUT		msecs_to_jiffies(500)
 
 #define BRCMF_PCIE_MBDATA_TIMEOUT		msecs_to_jiffies(2000)
 
@@ -343,6 +350,15 @@ struct brcmf_otp_params {
 	bool valid;
 };
 
+enum brcmf_pcie_ds_state {
+	BRCMF_PCIE_DS_NONE,
+	BRCMF_PCIE_DS_ALLOWED,
+	BRCMF_PCIE_DS_SLEEP_PEND,
+	BRCMF_PCIE_DS_SLEEP,
+	BRCMF_PCIE_DS_EXIT_WAIT,
+	BRCMF_PCIE_DS_AWAKE,
+};
+
 struct brcmf_pciedev_info {
 	enum brcmf_pcie_state state;
 	bool in_irq;
@@ -379,6 +395,18 @@ struct brcmf_pciedev_info {
 	char sig_name[BRCMF_FW_NAME_LEN];
 	u32 fw_size;
 	bool skip_reset_vector;
+	/* protects ds_state, ds_active and ds_suspend */
+	spinlock_t ds_lock;
+	enum brcmf_pcie_ds_state ds_state;
+	int ds_active;
+	bool ds_suspend;
+	/* serializes the deep sleep mailbox messages */
+	struct mutex ds_mutex;
+	struct task_struct *ds_sender;
+	/* the interrupt thread while it runs */
+	struct task_struct *irq_thread;
+	wait_queue_head_t ds_wait;
+	struct delayed_work ds_deassert_work;
 #ifdef DEBUG
 	u32 console_interval;
 	bool console_active;
@@ -941,17 +969,219 @@ brcmf_pcie_send_mb_data(struct brcmf_pciedev_info *devinfo, u32 htod_mb_data)
 }
 
 
+static int brcmf_pcie_ds_send(struct brcmf_pciedev_info *devinfo, u32 data)
+{
+	int err;
+
+	mutex_lock(&devinfo->ds_mutex);
+	WRITE_ONCE(devinfo->ds_sender, current);
+	err = brcmf_pcie_send_mb_data(devinfo, data);
+	WRITE_ONCE(devinfo->ds_sender, NULL);
+	mutex_unlock(&devinfo->ds_mutex);
+
+	return err;
+}
+
+/* The handshake messages themselves go through the hooked rings */
+static bool brcmf_pcie_ds_skip(struct brcmf_pciedev_info *devinfo)
+{
+	return READ_ONCE(devinfo->ds_state) == BRCMF_PCIE_DS_NONE ||
+	       READ_ONCE(devinfo->ds_sender) == current;
+}
+
+static bool brcmf_pcie_ds_idle_locked(struct brcmf_pciedev_info *devinfo)
+{
+	lockdep_assert_held(&devinfo->ds_lock);
+
+	if (devinfo->ds_active || devinfo->ds_suspend)
+		return false;
+
+	if (devinfo->ds_state == BRCMF_PCIE_DS_SLEEP_PEND) {
+		devinfo->ds_state = BRCMF_PCIE_DS_SLEEP;
+		return true;
+	}
+	if (devinfo->ds_state == BRCMF_PCIE_DS_AWAKE)
+		mod_delayed_work(system_dfl_wq, &devinfo->ds_deassert_work,
+				 msecs_to_jiffies(BRCMF_PCIE_DS_IDLE_MS));
+	return false;
+}
+
+/* Without the ack the device stays awake */
+static void brcmf_pcie_ds_ack(struct brcmf_pciedev_info *devinfo)
+{
+	if (!brcmf_pcie_ds_send(devinfo, BRCMF_H2D_HOST_DS_ACK))
+		return;
+
+	spin_lock(&devinfo->ds_lock);
+	if (devinfo->ds_state == BRCMF_PCIE_DS_SLEEP)
+		devinfo->ds_state = BRCMF_PCIE_DS_ALLOWED;
+	spin_unlock(&devinfo->ds_lock);
+}
+
+static bool brcmf_pcie_ds_exited(struct brcmf_pciedev_info *devinfo)
+{
+	return READ_ONCE(devinfo->ds_state) != BRCMF_PCIE_DS_EXIT_WAIT ||
+	       READ_ONCE(devinfo->state) != BRCMFMAC_PCIE_STATE_UP;
+}
+
+static void brcmf_pcie_ds_wake(struct brcmf_pciedev_info *devinfo)
+{
+	bool up, assert = false, wait;
+
+	if (brcmf_pcie_ds_skip(devinfo))
+		return;
+
+	/* A device that is not up does not answer */
+	up = READ_ONCE(devinfo->state) == BRCMFMAC_PCIE_STATE_UP;
+	spin_lock(&devinfo->ds_lock);
+	devinfo->ds_active++;
+	if (up && devinfo->ds_state == BRCMF_PCIE_DS_SLEEP) {
+		devinfo->ds_state = BRCMF_PCIE_DS_EXIT_WAIT;
+		assert = true;
+	}
+	wait = up && devinfo->ds_state == BRCMF_PCIE_DS_EXIT_WAIT;
+	spin_unlock(&devinfo->ds_lock);
+
+	if (assert) {
+		brcmf_dbg(PCIE, "deep sleep: assert device wake\n");
+		if (brcmf_pcie_ds_send(devinfo, BRCMF_H2D_HOST_DW_ASSERT)) {
+			spin_lock(&devinfo->ds_lock);
+			if (devinfo->ds_state == BRCMF_PCIE_DS_EXIT_WAIT)
+				devinfo->ds_state = BRCMF_PCIE_DS_SLEEP;
+			spin_unlock(&devinfo->ds_lock);
+			wake_up(&devinfo->ds_wait);
+			return;
+		}
+	}
+	if (!wait)
+		return;
+
+	/* The exit note arrives through the interrupt thread itself */
+	if (READ_ONCE(devinfo->irq_thread) == current) {
+		usleep_range(1000, 1100);
+		return;
+	}
+	if (wait_event_timeout(devinfo->ds_wait, brcmf_pcie_ds_exited(devinfo),
+			       BRCMF_PCIE_DS_EXIT_TIMEOUT))
+		return;
+
+	brcmf_err(dev_get_drvdata(&devinfo->pdev->dev),
+		  "no deep sleep exit after device wake\n");
+	spin_lock(&devinfo->ds_lock);
+	if (devinfo->ds_state == BRCMF_PCIE_DS_EXIT_WAIT)
+		devinfo->ds_state = BRCMF_PCIE_DS_AWAKE;
+	spin_unlock(&devinfo->ds_lock);
+}
+
+static void brcmf_pcie_ds_idle(struct brcmf_pciedev_info *devinfo)
+{
+	bool ack;
+
+	if (brcmf_pcie_ds_skip(devinfo))
+		return;
+
+	spin_lock(&devinfo->ds_lock);
+	devinfo->ds_active--;
+	ack = brcmf_pcie_ds_idle_locked(devinfo);
+	spin_unlock(&devinfo->ds_lock);
+
+	if (ack) {
+		brcmf_dbg(PCIE, "deep sleep: ack pending request\n");
+		brcmf_pcie_ds_ack(devinfo);
+	}
+}
+
+static void brcmf_pcie_ds_deassert_worker(struct work_struct *work)
+{
+	struct brcmf_pciedev_info *devinfo =
+		container_of(work, struct brcmf_pciedev_info,
+			     ds_deassert_work.work);
+	bool deassert = false;
+
+	spin_lock(&devinfo->ds_lock);
+	if (devinfo->ds_state == BRCMF_PCIE_DS_AWAKE && !devinfo->ds_active &&
+	    !devinfo->ds_suspend) {
+		devinfo->ds_state = BRCMF_PCIE_DS_ALLOWED;
+		deassert = true;
+	}
+	spin_unlock(&devinfo->ds_lock);
+
+	if (!deassert)
+		return;
+
+	brcmf_dbg(PCIE, "deep sleep: deassert device wake\n");
+	if (brcmf_pcie_ds_send(devinfo, BRCMF_H2D_HOST_DW_DEASSERT)) {
+		spin_lock(&devinfo->ds_lock);
+		if (devinfo->ds_state == BRCMF_PCIE_DS_ALLOWED)
+			devinfo->ds_state = BRCMF_PCIE_DS_AWAKE;
+		spin_unlock(&devinfo->ds_lock);
+	}
+}
+
+static void brcmf_pcie_ds_enter_req(struct brcmf_pciedev_info *devinfo)
+{
+	bool ack = false;
+
+	if (devinfo->ds_state == BRCMF_PCIE_DS_NONE) {
+		brcmf_pcie_send_mb_data(devinfo, BRCMF_H2D_HOST_DS_ACK);
+		return;
+	}
+
+	spin_lock(&devinfo->ds_lock);
+	if (devinfo->ds_state == BRCMF_PCIE_DS_ALLOWED) {
+		devinfo->ds_state = BRCMF_PCIE_DS_SLEEP_PEND;
+		ack = brcmf_pcie_ds_idle_locked(devinfo);
+	} else {
+		brcmf_dbg(PCIE, "deep sleep request in state %d\n",
+			  devinfo->ds_state);
+	}
+	spin_unlock(&devinfo->ds_lock);
+
+	if (ack)
+		brcmf_pcie_ds_ack(devinfo);
+}
+
+static void brcmf_pcie_ds_exit_note(struct brcmf_pciedev_info *devinfo)
+{
+	if (devinfo->ds_state == BRCMF_PCIE_DS_NONE)
+		return;
+
+	spin_lock(&devinfo->ds_lock);
+	if (devinfo->ds_state == BRCMF_PCIE_DS_EXIT_WAIT ||
+	    devinfo->ds_state == BRCMF_PCIE_DS_SLEEP) {
+		devinfo->ds_state = BRCMF_PCIE_DS_AWAKE;
+		brcmf_pcie_ds_idle_locked(devinfo);
+	}
+	spin_unlock(&devinfo->ds_lock);
+	wake_up(&devinfo->ds_wait);
+}
+
+static void brcmf_pcie_ring_ds_wake(void *ctx)
+{
+	struct brcmf_pcie_ringbuf *ring = ctx;
+
+	brcmf_pcie_ds_wake(ring->devinfo);
+}
+
+static void brcmf_pcie_ring_ds_idle(void *ctx)
+{
+	struct brcmf_pcie_ringbuf *ring = ctx;
+
+	brcmf_pcie_ds_idle(ring->devinfo);
+}
+
 static void brcmf_pcie_handle_mb_data(struct brcmf_pciedev_info *devinfo,
 				      u32 dtoh_mb_data)
 {
 	brcmf_dbg(PCIE, "D2H_MB_DATA: 0x%04x\n", dtoh_mb_data);
 	if (dtoh_mb_data & BRCMF_D2H_DEV_DS_ENTER_REQ)  {
 		brcmf_dbg(PCIE, "D2H_MB_DATA: DEEP SLEEP REQ\n");
-		brcmf_pcie_send_mb_data(devinfo, BRCMF_H2D_HOST_DS_ACK);
-		brcmf_dbg(PCIE, "D2H_MB_DATA: sent DEEP SLEEP ACK\n");
+		brcmf_pcie_ds_enter_req(devinfo);
 	}
-	if (dtoh_mb_data & BRCMF_D2H_DEV_DS_EXIT_NOTE)
+	if (dtoh_mb_data & BRCMF_D2H_DEV_DS_EXIT_NOTE) {
 		brcmf_dbg(PCIE, "D2H_MB_DATA: DEEP SLEEP EXIT\n");
+		brcmf_pcie_ds_exit_note(devinfo);
+	}
 	if (dtoh_mb_data & BRCMF_D2H_DEV_D3_ACK) {
 		brcmf_dbg(PCIE, "D2H_MB_DATA: D3 ACK\n");
 		devinfo->mbdata_completed = true;
@@ -1121,6 +1351,7 @@ static irqreturn_t brcmf_pcie_isr_thread(int irq, void *arg)
 		return IRQ_HANDLED;
 
 	devinfo->in_irq = true;
+	WRITE_ONCE(devinfo->irq_thread, current);
 	status = brcmf_pcie_read_pcie32(devinfo, devinfo->reginfo->mailboxint);
 	brcmf_dbg(PCIE, "Enter %x\n", status);
 	if (status) {
@@ -1138,6 +1369,7 @@ static irqreturn_t brcmf_pcie_isr_thread(int irq, void *arg)
 		brcmf_pcie_write_pcie32(devinfo, devinfo->reginfo->mailboxmask,
 					devinfo->reginfo->int_d2h_db |
 					devinfo->reginfo->int_fn0);
+	WRITE_ONCE(devinfo->irq_thread, NULL);
 	devinfo->in_irq = false;
 	return IRQ_HANDLED;
 }
@@ -1357,6 +1589,10 @@ brcmf_pcie_alloc_dma_and_ring(struct brcmf_pciedev_info *devinfo, u32 ring_id,
 				     brcmf_pcie_ring_mb_update_wptr,
 				     brcmf_pcie_ring_mb_write_rptr,
 				     brcmf_pcie_ring_mb_write_wptr, ring);
+	if (ring_id < BRCMF_NROF_H2D_COMMON_MSGRINGS)
+		brcmf_commonring_register_pm_cb(&ring->commonring,
+						brcmf_pcie_ring_ds_wake,
+						brcmf_pcie_ring_ds_idle);
 
 	return (ring);
 }
@@ -1550,6 +1786,9 @@ static int brcmf_pcie_init_ringbuffers(struct brcmf_pciedev_info *devinfo)
 					     brcmf_pcie_ring_mb_write_rptr,
 					     brcmf_pcie_ring_mb_write_wptr,
 					     ring);
+		brcmf_commonring_register_pm_cb(&ring->commonring,
+						brcmf_pcie_ring_ds_wake,
+						brcmf_pcie_ring_ds_idle);
 		ring->w_idx_addr = h2d_w_idx_ptr;
 		ring->r_idx_addr = h2d_r_idx_ptr;
 		h2d_w_idx_ptr += idx_offset;
@@ -1870,6 +2109,19 @@ brcmf_pcie_init_share_ram_info(struct brcmf_pciedev_info *devinfo,
 		if (shared->flags & BRCMF_PCIE_SHARED_DAR)
 			host_cap |= BRCMF_HOSTCAP_H2D_DAR;
 		host_cap |= BRCMF_HOSTCAP_DS_NO_OOB_DW;
+		/*
+		 * Inband device wake comes on top of no out-of-band device
+		 * wake, as Broadcom's DHD driver sets it. The handshake is
+		 * tested with the mailbox on the control ring of the BCM4364
+		 * and BCM4377.
+		 */
+		if ((shared->flags & BRCMF_PCIE_SHARED_INBAND_DS) &&
+		    shared->mb_via_ctl &&
+		    (devinfo->ci->chip == BRCM_CC_4364_CHIP_ID ||
+		     devinfo->ci->chip == BRCM_CC_4377_CHIP_ID)) {
+			host_cap |= BRCMF_HOSTCAP_DS_INBAND_DW;
+			devinfo->ds_state = BRCMF_PCIE_DS_ALLOWED;
+		}
 
 		brcmf_pcie_write_tcm32(devinfo, sharedram_addr +
 				       BRCMF_SHARED_HOST_CAP_OFFSET,
@@ -2893,6 +3145,11 @@ brcmf_pcie_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return ret;
 
 	devinfo->pdev = pdev;
+	spin_lock_init(&devinfo->ds_lock);
+	mutex_init(&devinfo->ds_mutex);
+	init_waitqueue_head(&devinfo->ds_wait);
+	INIT_DELAYED_WORK(&devinfo->ds_deassert_work,
+			  brcmf_pcie_ds_deassert_worker);
 	pcie_bus_dev = NULL;
 	devinfo->ci = brcmf_chip_attach(devinfo, pdev->device,
 					&brcmf_pcie_buscore_ops);
@@ -3020,6 +3277,15 @@ brcmf_pcie_remove(struct pci_dev *pdev)
 		return;
 
 	devinfo = bus->bus_priv.pcie->devinfo;
+	if (devinfo->ds_state != BRCMF_PCIE_DS_NONE) {
+		/* brcmf_detach() still sends ioctls and flowring deletes */
+		brcmf_pcie_ds_wake(devinfo);
+		spin_lock(&devinfo->ds_lock);
+		devinfo->ds_state = BRCMF_PCIE_DS_NONE;
+		spin_unlock(&devinfo->ds_lock);
+		/* nothing queues it once the state is NONE */
+		cancel_delayed_work_sync(&devinfo->ds_deassert_work);
+	}
 	brcmf_pcie_bus_console_read(devinfo, false);
 	brcmf_pcie_fwcon_timer(devinfo, false);
 
@@ -3061,6 +3327,18 @@ brcmf_pcie_remove(struct pci_dev *pdev)
 #ifdef CONFIG_PM
 
 
+/* The device is awake, let it sleep again once idle */
+static void brcmf_pcie_ds_end_suspend(struct brcmf_pciedev_info *devinfo)
+{
+	spin_lock(&devinfo->ds_lock);
+	if (devinfo->ds_state != BRCMF_PCIE_DS_NONE) {
+		devinfo->ds_suspend = false;
+		devinfo->ds_state = BRCMF_PCIE_DS_AWAKE;
+		brcmf_pcie_ds_idle_locked(devinfo);
+	}
+	spin_unlock(&devinfo->ds_lock);
+}
+
 static int brcmf_pcie_pm_enter_D3(struct device *dev)
 {
 	struct brcmf_pciedev_info *devinfo;
@@ -3074,6 +3352,15 @@ static int brcmf_pcie_pm_enter_D3(struct device *dev)
 	brcmf_pcie_fwcon_timer(devinfo, false);
 	brcmf_bus_change_state(bus, BRCMF_BUS_DOWN);
 
+	if (devinfo->ds_state != BRCMF_PCIE_DS_NONE) {
+		spin_lock(&devinfo->ds_lock);
+		devinfo->ds_suspend = true;
+		spin_unlock(&devinfo->ds_lock);
+		cancel_delayed_work_sync(&devinfo->ds_deassert_work);
+		brcmf_pcie_ds_wake(devinfo);
+		brcmf_pcie_ds_idle(devinfo);
+	}
+
 	devinfo->mbdata_completed = false;
 	brcmf_pcie_send_mb_data(devinfo, BRCMF_H2D_HOST_D3_INFORM);
 
@@ -3082,6 +3369,7 @@ static int brcmf_pcie_pm_enter_D3(struct device *dev)
 	if (!devinfo->mbdata_completed) {
 		if (devinfo->wowl_enabled) {
 			brcmf_err(bus, "Timeout on response for entering D3 substate\n");
+			brcmf_pcie_ds_end_suspend(devinfo);
 			brcmf_bus_change_state(bus, BRCMF_BUS_UP);
 			return -EIO;
 		}
@@ -3126,6 +3414,7 @@ static int brcmf_pcie_pm_leave_D3(struct device *dev)
 		if (brcmf_pcie_send_mb_data(devinfo, BRCMF_H2D_HOST_D0_INFORM))
 			goto cleanup;
 		brcmf_dbg(PCIE, "Hot resume, continue....\n");
+		brcmf_pcie_ds_end_suspend(devinfo);
 		brcmf_pcie_select_core(devinfo, BCMA_CORE_PCIE2);
 		brcmf_bus_change_state(bus, BRCMF_BUS_UP);
 		brcmf_pcie_intr_enable(devinfo);
-- 
2.56.0

